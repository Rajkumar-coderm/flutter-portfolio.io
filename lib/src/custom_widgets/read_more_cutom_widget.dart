import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/src/src.dart';

class ReadMoreTextWidget extends StatefulWidget {
  ReadMoreTextWidget(
    this.text, {
    this.textStyle,
  });
  final String text;
  final TextStyle? textStyle;

  @override
  _ReadMoreTextWidgetState createState() => _ReadMoreTextWidgetState();
}

class _ReadMoreTextWidgetState extends State<ReadMoreTextWidget> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 180) {
      firstHalf = widget.text.substring(0, 180);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) => secondHalf.isEmpty
      ? Text(firstHalf)
      : AnimatedCrossFade(
          crossFadeState:
              flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 250),
          firstChild: _readMoreRichText(),
          secondChild: _readMoreRichText(),
        );

  RichText _readMoreRichText() => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: flag ? ('$firstHalf...') : (firstHalf + secondHalf),
              style: widget.textStyle ?? Styles.mediumGrey15,
            ),
            TextSpan(
              text: flag ? 'show more' : 'show less',
              style: const TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    flag = !flag;
                  });
                },
            ),
          ],
        ),
      );
}
