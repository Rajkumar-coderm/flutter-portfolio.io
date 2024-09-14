import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/src/src.dart';

class AboutMeSectionWidget extends StatelessWidget {
  const AboutMeSectionWidget({super.key});

  static List<SkillsDataModel> skillsList = [
    SkillsDataModel(logoUrl: AssetsConstant.pythonLogo, name: 'Python'),
    SkillsDataModel(logoUrl: AssetsConstant.dartLogo, name: 'Dart'),
    SkillsDataModel(logoUrl: AssetsConstant.flutterLogo, name: 'Flutter'),
    SkillsDataModel(
        logoUrl: AssetsConstant.androidStudio, name: 'Android Studio'),
    SkillsDataModel(logoUrl: AssetsConstant.vscodeLogo, name: 'Visual Studio'),
    SkillsDataModel(logoUrl: AssetsConstant.javascriptLogo, name: 'Javascript'),
    SkillsDataModel(logoUrl: AssetsConstant.htmlCssLogo, name: 'HTML&CSS'),
  ];

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: Dimens().percentHeght(1) - Dimens().eighty,
          width: Dimens().percentWidth(1),
          child: Responsive.isMobile(context) || Responsive.isTablet(context)
              ? SingleChildScrollView(
                  child: MainRenderAboutMeWidget(skillsList: skillsList),
                )
              : MainRenderAboutMeWidget(skillsList: skillsList),
        ),
      );
}

class MainRenderAboutMeWidget extends StatelessWidget {
  const MainRenderAboutMeWidget({
    super.key,
    required this.skillsList,
  });

  final List<SkillsDataModel> skillsList;

  @override
  Widget build(BuildContext context) => Flex(
        direction: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? Axis.vertical
            : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfilePictureWidget(),
          Dimens().boxWidth(Dimens().thirty),
          AboutMeDetailsWidget(skillsList: skillsList),
        ],
      );
}

class AboutMeDetailsWidget extends StatelessWidget {
  const AboutMeDetailsWidget({
    super.key,
    required this.skillsList,
  });

  final List<SkillsDataModel> skillsList;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'About Me:',
            style: Styles.boldSecodry25,
          ),
          Dimens().boxHeight(Dimens().ten),
          SizedBox(
            width: Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens().percentWidth(1)
                : Dimens().percentWidth(.5),
            child: Text(
              StringConstant.aboutMeDetails,
              style: Responsive.isMobile(context)
                  ? Styles.mediumWhite16
                  : Styles.mediumWhite25,
            ),
          ),
          Dimens().boxHeight(Dimens().fifteen),
          SizedBox(
            width: Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens().percentWidth(1)
                : Dimens().percentWidth(.5),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '2+ ',
                    style: Responsive.isMobile(context)
                        ? Styles.boldSecodry25
                        : Styles.boldSecodry35,
                  ),
                  TextSpan(
                    text: StringConstant.exprienxDetails,
                    style: Responsive.isMobile(context)
                        ? Styles.mediumWhite16
                        : Styles.mediumWhite25,
                  ),
                ],
              ),
            ),
          ),
          Dimens().boxHeight(Dimens().fifteen),
          Text(
            'My Skill',
            style: Styles.boldSecodry25,
          ),
          Dimens().boxHeight(Dimens().fifteen),
          SizedBox(
            width: Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens().percentWidth(1)
                : Dimens().percentWidth(.5),
            child: Wrap(
              spacing: Dimens().twenty,
              runSpacing: Dimens().twenty,
              children: List.generate(
                skillsList.length,
                (index) => SkillCardWidget(
                  logoAsset: skillsList[index].logoUrl,
                  name: skillsList[index].name,
                ),
              ),
            ),
          )
        ],
      );
}

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: Responsive.isMobile(context)
            ? Dimens().threeHundred / 2
            : (Dimens().fiveHundred + Dimens().oneHundred) / 2,
        backgroundColor: ColorsValue.color00ffda,
        backgroundImage: const AssetImage(
          AssetsConstant.profileImage,
        ),
      );
}

class SkillCardWidget extends StatefulWidget {
  const SkillCardWidget({
    super.key,
    required this.logoAsset,
    required this.name,
  });

  final String logoAsset;
  final String name;

  @override
  State<SkillCardWidget> createState() => _SkillCardWidgetState();
}

class _SkillCardWidgetState extends State<SkillCardWidget> {
  bool _isHovered = false;

  double get width =>
      (Responsive.isMobile(context) ? Dimens().fifty : Dimens().eighty) +
      (_isHovered ? 10 : 0);
  double get height =>
      (Responsive.isMobile(context) ? Dimens().fifty : Dimens().eighty) +
      (_isHovered ? 10 : 0);

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: MouseCursor.defer,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: width,
              height: height,
              padding: Dimens().edgeInsetsAll(Dimens().twenty),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.logoAsset),
                ),
                borderRadius: BorderRadius.circular(Dimens().fifteen),
              ),
            ),
            Container(
              width: width,
              height: height,
              padding: Dimens().edgeInsetsAll(Dimens().twenty),
              decoration: BoxDecoration(
                color: _isHovered
                    ? ColorsValue.primaryColor.withOpacity(.4)
                    : Colors.blueGrey.withOpacity(.4),
                borderRadius: BorderRadius.circular(Dimens().fifteen),
                border: Border.all(color: ColorsValue.color00ffda),
              ),
            ),
            if (_isHovered) ...[
              SizedBox(
                width: width,
                child: Text(
                  widget.name,
                  style: Styles.mediumWhite20,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      );
}

class SkillsDataModel {
  SkillsDataModel({
    required this.logoUrl,
    required this.name,
  });

  final String logoUrl;
  final String name;
}
