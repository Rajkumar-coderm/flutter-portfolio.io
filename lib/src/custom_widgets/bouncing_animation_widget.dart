import 'dart:math';

import 'package:flutter/material.dart';

class BouncingImage extends StatefulWidget {
  const BouncingImage({
    super.key,
    required this.imagePath,
    this.onTap,
  });
  final String imagePath;
  final VoidCallback? onTap;

  @override
  _BouncingImageState createState() => _BouncingImageState();
}

class _BouncingImageState extends State<BouncingImage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final List<AnimationController> _bubbleAnimationControllers = [];
  final List<Animation<double>> _bubbleScaleAnimations = [];
  final List<Color> _bubbleColors = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);

    for (var i = 0; i < 10; i++) {
      _bubbleAnimationControllers.add(AnimationController(
        vsync: this,
        duration: Duration(milliseconds: Random().nextInt(500) + 500),
      ));
      _bubbleScaleAnimations.add(Tween<double>(begin: 0.0, end: 1.0)
          .animate(_bubbleAnimationControllers[i]));
      _bubbleColors.add(Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        0.5,
      ));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in _bubbleAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (event) {
            _animationController.forward();
            for (var controller in _bubbleAnimationControllers) {
              controller.forward();
            }
          },
          onExit: (event) {
            _animationController.reverse();
            for (var controller in _bubbleAnimationControllers) {
              controller.reverse();
            }
          },
          child: Stack(
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.network(
                  widget.imagePath,
                ),
              ),
            ],
          ),
        ),
      );
}

class RandomPairMatch extends StatefulWidget {
  const RandomPairMatch({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RandomPairMatch> createState() => _RandomPairMatchState();
}

class _RandomPairMatchState extends State<RandomPairMatch> {
  List<String> _cards = [];
  List<bool> _isFlipped = [];
  int _pairsMatched = 0;
  int _totalMoves = 0;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    _cards = [];
    _isFlipped = [];
    _pairsMatched = 0;
    _totalMoves = 0;
    _isGameOver = false;
    // Create pairs of cards (8 pairs in this example)
    for (var i = 0; i < 8; i++) {
      _cards.addAll([i.toString(), i.toString()]);
    }
    // Shuffle the cards
    _cards.shuffle();
    // Initialize all cards to not flipped
    _isFlipped = List.filled(_cards.length, false);
  }

  void _flipCard(int index) {
    setState(() {
      _isFlipped[index] = true;
      _totalMoves++;
      // Check if two cards are flipped
      if (_isFlipped.where((element) => element).length == 2) {
        // Get indices of the flipped cards
        var firstFlippedIndex = _isFlipped.indexOf(true);
        var secondFlippedIndex =
            _isFlipped.indexOf(true, firstFlippedIndex + 1);
        // Check if the cards match
        if (_cards[firstFlippedIndex] == _cards[secondFlippedIndex]) {
          _pairsMatched++;
          // Check if all pairs are matched
          if (_pairsMatched == (_cards.length / 2)) {
            _isGameOver = true;
          }
          // Don't flip the cards back if they match
          _isFlipped[firstFlippedIndex] = true;
          _isFlipped[secondFlippedIndex] = true;
        } else {
          // If cards don't match, flip them back after a short delay
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _isFlipped[firstFlippedIndex] = false;
              _isFlipped[secondFlippedIndex] = false;
            });
          });
        }
        // Reset the flip status for the next move
        _isFlipped = _isFlipped.map((e) => e ? e : e).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Display game information
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pairs matched: $_pairsMatched/4'),
              const SizedBox(width: 20),
              Text('Total moves: $_totalMoves'),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 300 / 100,
            ),
            itemCount: _cards.length,
            itemBuilder: (BuildContext context, int index) {
              // Check if card is flipped or game over
              if (_isFlipped[index] || _isGameOver) {
                return SizedBox(
                  child: Card(
                    child: Center(
                      child: Text(
                        _cards[index],
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              } else {
                return Card(
                  child: InkWell(
                    onTap: () {
                      _flipCard(index);
                    },
                    child: const Center(
                      child: Icon(Icons.question_mark, size: 50),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          // Reset and End game buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isGameOver ? null : _resetGame,
                child: const Text('Reset game'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isGameOver
                    ? null
                    : () {
                        setState(() {
                          _isGameOver = true;
                        });
                      },
                child: const Text('End game'),
              ),
            ],
          ),
        ],
      );
}
