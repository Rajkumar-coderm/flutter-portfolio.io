import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/src/src.dart';

class MyServiceSectionWidget extends StatelessWidget {
  MyServiceSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Services',
              style: Styles.boldSecodry25,
            ),
            Dimens().boxHeight(Dimens().thirty),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HexagonWidget(
                  iconData: Icons.code,
                  title: 'Front-end\nDevelopment',
                ),
                SizedBox(width: 20),
                HexagonWidget(
                  iconData: Icons.settings,
                  title: 'Back-end\nDevelopment',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HexagonWidget(
                  iconData: Icons.phone_android,
                  title: 'Mobile App\nDevelopment',
                ),
                SizedBox(width: 20),
                HexagonWidget(
                  iconData: Icons.pest_control,
                  title: 'Skiils',
                ),
                SizedBox(width: 20),
                HexagonWidget(
                  iconData: Icons.device_hub,
                  title: 'Responsive\nDesign',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HexagonWidget(
                  iconData: Icons.settings,
                  title: 'Database\nManagement',
                ),
                SizedBox(width: 20),
                HexagonWidget(
                  iconData: Icons.error,
                  title: 'Unit Testing &\nError Fixing',
                ),
              ],
            ),
          ],
        ),
      );
}

class HexagonWidget extends StatelessWidget {
  const HexagonWidget({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: Responsive.isMobile(context)
            ? Dimens().oneHundred
            : Dimens().oneHundredEighty,
        height: Responsive.isMobile(context)
            ? Dimens().oneHundredFifteen
            : Dimens().twoHundred,
        child: ClipPath(
          clipper: HexagonClipper(),
          child: Container(
            padding: Dimens().edgeInsetsAll(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xff8921aa),
                  Colors.purple.shade800,
                  Colors.purple.shade600,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: Responsive.isMobile(context)
                        ? Dimens().twentyFive
                        : Dimens().forty,
                    color: Colors.white,
                  ),
                  Dimens().boxHeight(Dimens().five),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Responsive.isMobile(context)
                        ? Styles.mediumWhite12
                        : Styles.mediumWhite16,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var width = size.width;
    var height = size.height;
    path.moveTo(width / 2, 0);
    path.lineTo(width, height / 4);
    path.lineTo(width, 3 * height / 4);
    path.lineTo(width / 2, height);
    path.lineTo(0, 3 * height / 4);
    path.lineTo(0, height / 4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
