import 'package:flutter/material.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class HoverText extends StatefulWidget {
  const HoverText({
    Key? key,
    required this.text,
    required this.normalStyle,
    required this.hoverStyle,
    this.isSelected = false,
    required this.lableIcon,
  }) : super(key: key);
  final String text;
  final TextStyle normalStyle;
  final TextStyle hoverStyle;
  final bool isSelected;
  final IconData lableIcon;

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        hitTestBehavior: HitTestBehavior.opaque,
        cursor: MouseCursor.defer,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: Dimens().edgeInsets(bottom: Dimens().five),
          decoration: widget.isSelected || _isHovered
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorsValue.color00ffda,
                      width: 3.0,
                    ),
                  ),
                )
              : null,
          child: Row(
            children: [
              Icon(
                widget.lableIcon,
                color: _isHovered || widget.isSelected
                    ? widget.hoverStyle.color
                    : widget.normalStyle.color,
              ),
              Dimens().boxWidth(Dimens().three),
              Text(
                widget.text,
                style: _isHovered || widget.isSelected
                    ? widget.hoverStyle
                    : widget.normalStyle,
              ),
            ],
          ),
        ),
      );
}
