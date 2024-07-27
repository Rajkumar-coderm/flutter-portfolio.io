import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class HoverFlipImage extends StatefulWidget {
  HoverFlipImage({
    required this.frontImageUrl,
    required this.description,
    required this.projectName,
  });
  final String frontImageUrl;
  final String description;
  final String projectName;

  @override
  _HoverFlipImageState createState() => _HoverFlipImageState();
}

class _HoverFlipImageState extends State<HoverFlipImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 600,
      ),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          if (Responsive.isTablet(context) || Responsive.isTablet(context)) {}
        },
        child: MouseRegion(
          hitTestBehavior: HitTestBehavior.opaque,
          onEnter: (_) => _controller.forward(),
          onExit: (_) => _controller.reverse(),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final isFront = _animation.value < 0.5;
              final angle = _animation.value * 3.14159;
              final transform = Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle);
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: isFront
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsValue.color7562E0),
                          borderRadius: BorderRadius.circular(Dimens().twelve),
                        ),
                        height: 300.sp,
                        child: Image.asset(
                          widget.frontImageUrl,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsValue.color7562E0),
                          borderRadius: BorderRadius.circular(Dimens().twelve),
                        ),
                        padding: Dimens().edgeInsetsAll(Dimens().eight),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(3.14159),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.projectName,
                                style: Styles.mediumWhite25.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Dimens().boxHeight(Dimens().five),
                              const Divider(
                                color: Colors.white,
                              ),
                              Dimens().boxHeight(Dimens().five),
                              Text(
                                widget.description,
                                style: Styles.mediumGrey15,
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
