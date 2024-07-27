import 'package:flutter/material.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class HomeSectionWidget extends StatelessWidget {
  const HomeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Dimens().percentHeght(1) - Dimens().eighty,
        child: Flex(
          direction:
              Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? const Expanded(child: ProfileDetailsWidget())
                : SizedBox(
                    width: Dimens().percentWidth(.4),
                    child: const ProfileDetailsWidget(),
                  ),
            if (Responsive.isWeb(context)) ...[
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: Dimens().fiveHundred,
                    width: Dimens().fiveHundred,
                    decoration: BoxDecoration(
                      color: ColorsValue.color00ffda,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Image.asset(
                    'assets/svg/flutter_b1.png',
                  ),
                ],
              )
            ],
          ],
        ),
      );
}

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var iconSize = Responsive.isMobile(context) ? 50 : 85;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello, i’m',
          style: Styles.mediumBlue20,
        ),
        GradientText(
          'Rajkumar Gahane',
          style: Responsive.isMobile(context)
              ? Styles.mediumWhite35
              : Styles.mediumWhite52,
          gradient: LinearGradient(
            colors: [
              ColorsValue.color00ffda,
              const Color(0xff8921aa),
              const Color(0xff8921aa),
            ],
          ),
        ),
        Text(
          'I build mobile and web apps.',
          style: Responsive.isMobile(context)
              ? Styles.mediumGrey35
              : Styles.mediumGrey52,
        ),
        Text(
          "I am a Software Developer from India that specialises in developing mobile apps. I'm fluttering right now!",
          style: Responsive.isMobile(context)
              ? Styles.mediumGrey15
              : Styles.mediumGrey20,
        ),
        Dimens().boxHeight(Dimens().thirty),
        Row(
          children: [
            BouncingImage(
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/facebook.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/linkedin.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/instagram.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/whatsapp.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/github.png',
            ),
          ],
        )
      ],
    );
  }
}
