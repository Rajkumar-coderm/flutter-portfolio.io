import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class HomeSectionWidget extends StatelessWidget {
  const HomeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Get.height - Dimens().eighty,
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
  Widget build(BuildContext context) => Column(
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
          InkWell(
            focusColor: ColorsValue.color00ffda,
            splashColor: ColorsValue.color00ffda,
            borderRadius: BorderRadius.circular(Dimens().fifty),
            onTap: () {},
            child: Container(
              padding: Dimens().edgeInsetsSymmetric(
                vertical: Responsive.isMobile(context)
                    ? Dimens().ten
                    : Dimens().fifteen,
                horizontal: Dimens().twentyFive,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsValue.color00ffda,
                ),
                borderRadius: BorderRadius.circular(Dimens().fifty),
              ),
              child: Text(
                'Download CV',
                style: Responsive.isMobile(context)
                    ? Styles.mediumWhite16
                    : Styles.mediumWhite20,
              ),
            ),
          ),
        ],
      );
}
