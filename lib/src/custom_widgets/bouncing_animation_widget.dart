import 'dart:math';

import 'package:flutter/material.dart';

class BouncingImage extends StatefulWidget {
  const BouncingImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

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
        onTap: () {},
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
              ...List.generate(
                _bubbleAnimationControllers.length,
                (index) => ScaleTransition(
                  scale: _bubbleScaleAnimations[index],
                  child: Container(
                    margin: EdgeInsets.only(
                      top: Random().nextInt(50).toDouble(),
                      left: Random().nextInt(90).toDouble(),
                      bottom: Random().nextInt(50).toDouble(),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _bubbleColors[index],
                      border: Border.all(
                        color: _bubbleColors[index],
                        // width: 1,
                      ),
                    ),
                    child: Container(
                      width: Random().nextInt(10).toDouble(),
                      height: Random().nextInt(10).toDouble(),
                      // margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _bubbleColors[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
