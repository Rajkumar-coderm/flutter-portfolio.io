import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/src/src.dart';

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
              CircleAvatar(
                radius: (Dimens().fiveHundred) / 2,
                backgroundColor: ColorsValue.color00ffda,
                backgroundImage: const AssetImage('assets/svg/flutter_b1.png'),
              ),
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
              onTap: () {
                openInWindow(
                  'https://www.facebook.com/rajkumar.gahane2001',
                  'Rajkumar Resume',
                );
              },
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/facebook.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              onTap: () {
                openInWindow(
                  'https://linkedin.com/in/rajkumar-gahane-4354021b7',
                  'Rajkumar Resume',
                );
              },
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/linkedin.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              onTap: () {
                openInWindow(
                  'https://www.instagram.com/i.rajkumargahane/',
                  'Rajkumar Resume',
                );
              },
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/instagram.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              onTap: () {
                openInWindow(
                  'https://api.whatsapp.com/send?phone=+919168716592',
                  'Rajkumar Resume',
                );
              },
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/whatsapp.png',
            ),
            Dimens().boxWidth(Dimens().ten),
            BouncingImage(
              onTap: () {
                openInWindow(
                  'https://github.com/Rajkumar-coderm',
                  'Rajkumar Resume',
                );
              },
              imagePath:
                  'https://img.icons8.com/bubbles/$iconSize/000000/github.png',
            ),
          ],
        )
      ],
    );
  }
}
