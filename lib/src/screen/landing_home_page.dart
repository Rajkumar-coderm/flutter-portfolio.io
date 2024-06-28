import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class LandingHomePage extends StatefulWidget {
  const LandingHomePage({super.key});

  @override
  State<LandingHomePage> createState() => _LandingHomePageState();
}

class _LandingHomePageState extends State<LandingHomePage> {
  final PageController _scrollController = PageController();

  void _scrollToIndex(int index) async {
    await _scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInToLinear,
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        appBar: _customAppBar(),
        body: Container(
          padding: Responsive.isWeb(context) || Responsive.isTablet(context)
              ? Dimens().edgeInsetsSymmetric(
                  horizontal: Responsive.isTablet(context)
                      ? Dimens().eighty
                      : Dimens().oneHundredFifty,
                  vertical: Responsive.isTablet(context)
                      ? Dimens().ten
                      : Dimens().fifteen,
                )
              : Dimens().edgeInsetsSymmetric(
                  horizontal: Dimens().twelve,
                  vertical: Dimens().eight,
                ),
          height: Get.height,
          width: Get.width,
          child: PageView(
            controller: _scrollController,
            onPageChanged: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            scrollDirection: Axis.vertical,
            children: [
              const HomeSectionWidget(),
              const AboutMeSectionWidget(),
            ],
          ),
        ),
      );

  PreferredSize _customAppBar() => PreferredSize(
        preferredSize: Size(Get.width, Get.height),
        child: Container(
          padding: Responsive.isWeb(context) || Responsive.isTablet(context)
              ? Dimens().edgeInsetsSymmetric(
                  horizontal: Responsive.isTablet(context)
                      ? Dimens().eighty
                      : Dimens().oneHundredFifty,
                  vertical: Responsive.isTablet(context)
                      ? Dimens().ten
                      : Dimens().fifteen,
                )
              : Dimens().edgeInsetsSymmetric(
                  horizontal: Dimens().twelve,
                  vertical: Dimens().eight,
                ),
          decoration: BoxDecoration(
            color: ColorsValue.darkPrimaryColro,
            boxShadow: [
              BoxShadow(
                color: ColorsValue.color00ffda,
                blurRadius: Dimens().seven,
                spreadRadius: 0.2,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'RAJKUMAR',
                    style: Responsive.isMobile(context)
                        ? Styles.boldSecodry25
                        : Styles.boldSecodry35,
                  ),
                  const Spacer(),
                  Responsive.isMobile(context)
                      ? Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                          size: Dimens().thirty,
                        )
                      : HeaderMenuWidget(
                          selectedIndex: selectedIndex,
                          onTap: (index) async {
                            setState(() {
                              selectedIndex = index;
                            });
                            _scrollToIndex(index);
                          },
                        )
                ],
              )
            ],
          ),
        ),
      );
}

class HeaderMenuWidget extends StatelessWidget {
  const HeaderMenuWidget({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final Function(int index) onTap;
  final int selectedIndex;

  static List<HeaderTabModel> tabList = [
    HeaderTabModel(title: 'Home', lableIcon: Icons.home_outlined),
    HeaderTabModel(title: 'About', lableIcon: Icons.person_outline),
    HeaderTabModel(title: 'Projects', lableIcon: Icons.work_outline_outlined),
    HeaderTabModel(title: 'Contact', lableIcon: Icons.contact_support_outlined),
  ];

  @override
  Widget build(BuildContext context) => Row(
        children: List.generate(
          tabList.length,
          (index) => InkWell(
            onTap: () {
              onTap(index);
            },
            child: Container(
              margin: Dimens().edgeInsets(right: Dimens().thirty),
              child: HoverText(
                text: tabList[index].title,
                normalStyle: Styles.mediumWhite20,
                hoverStyle: Styles.mediumSecondryPrimary20,
                lableIcon: tabList[index].lableIcon,
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ).toList(),
      );
}

class HeaderTabModel {
  HeaderTabModel({
    required this.title,
    required this.lableIcon,
  });

  final String title;
  final IconData lableIcon;
}
