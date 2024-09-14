import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/src/src.dart';
import 'package:get/get.dart';

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

  RxBool isOpendDrawer = false.obs;

  RxBool isOpenSuggentionBox = true.obs;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        appBar: _customAppBar(),
        floatingActionButton: Stack(
          children: [
            Positioned(
              right: 16.0,
              bottom: 16.0,
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (isOpenSuggentionBox.value) ...[
                      InkWell(
                        onTap: () {
                          isOpenSuggentionBox.value =
                              !isOpenSuggentionBox.value;
                          setState(() {});
                        },
                        child: Container(
                          padding: Dimens().edgeInsetsAll(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsValue.color00ffda,
                          ),
                          child: Icon(
                            Icons.close,
                            color: ColorsValue.primaryColor,
                          ),
                        ),
                      ),
                      Dimens().boxHeight(Dimens().five),
                      SizedBox(
                        width: 300,
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-tUzKhAhZojMzYZzMo6qCKxbsEf0qEcIwjA&s',
                              ), // Replace with your image
                            ),
                            title: Text('Book a Meeting with me Rajkumar'),
                          ),
                        ),
                      ),
                      Dimens().boxHeight(Dimens().five),
                      Card(
                        elevation: 8.0,
                        margin: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: 350,
                          padding: const EdgeInsets.all(16.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Hi 👋 Call us for FREE!\nCall or Chat with our sales analysts without any phone carrier charges.',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    Dimens().boxHeight(Dimens().five),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.chat,
                        color: ColorsValue.primaryColor,
                      ),
                      backgroundColor: ColorsValue.color00ffda,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            physics: Responsive.isWeb(context)
                ? const ClampingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
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
              MyServiceSectionWidget(),
              const ProjectSectionWidget(),
            ],
          ),
        ),
      );

  PreferredSize _customAppBar() => PreferredSize(
        preferredSize: Size(Get.width, Get.height),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1050),
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
                mainAxisAlignment: Responsive.isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    'RAJKUMAR',
                    style: Responsive.isMobile(context)
                        ? Styles.boldSecodry25
                        : Styles.boldSecodry35,
                    gradient: LinearGradient(
                      colors: [
                        ColorsValue.color00ffda,
                        const Color(0xff8921aa),
                      ],
                    ),
                  ),
                  if (Responsive.isMobile(context) ||
                      Responsive.isTablet(context))
                    const Spacer(),
                  Responsive.isMobile(context)
                      ? Obx(
                          () => InkWell(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 350),
                              transitionBuilder: (child, anim) =>
                                  RotationTransition(
                                turns: child.key == const ValueKey('icon1')
                                    ? Tween<double>(begin: 1, end: 0.75)
                                        .animate(anim)
                                    : Tween<double>(begin: 0.75, end: 1)
                                        .animate(anim),
                                child: ScaleTransition(
                                  scale: anim,
                                  child: child,
                                ),
                              ),
                              child: isOpendDrawer.value
                                  ? Icon(
                                      Icons.close,
                                      key: const ValueKey('icon1'),
                                      color: Colors.white,
                                      size: Dimens().thirty,
                                    )
                                  : Icon(
                                      Icons.menu_outlined,
                                      key: const ValueKey('icon2'),
                                      color: Colors.white,
                                      size: Dimens().thirty,
                                    ),
                            ),
                            onTap: () {
                              setState(() {
                                isOpendDrawer.value = !isOpendDrawer.value;
                              });
                            },
                          ),
                        )
                      : HeaderMenuWidget(
                          selectedIndex: selectedIndex,
                          onTap: (index) async {
                            setState(() {
                              selectedIndex = index;
                            });
                            _scrollToIndex(index);
                          },
                        ),
                  if (Responsive.isWeb(context)) ...[
                    InkWell(
                      focusColor: ColorsValue.color00ffda,
                      splashColor: ColorsValue.color00ffda,
                      hoverColor: ColorsValue.color00ffda,
                      borderRadius: BorderRadius.circular(Dimens().fifty),
                      onTap: () async {
                        openInWindow(
                          'https://drive.google.com/file/d/1tykRLdwtqYP4XiypcYscvXcs3FFeW3aD/view?usp=sharing',
                          'Rajkumar Resume',
                        );
                      },
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
                    )
                  ],
                ],
              ),
              if (Responsive.isMobile(context) && isOpendDrawer.value) ...[
                Dimens().boxHeight(Dimens().ten),
                HeaderMenuWidget(
                  selectedIndex: selectedIndex,
                  onTap: (index) async {
                    setState(() {
                      selectedIndex = index;
                    });
                    _scrollToIndex(index);
                  },
                )
              ],
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
    HeaderTabModel(title: 'Home'),
    HeaderTabModel(title: 'About'),
    HeaderTabModel(title: 'Services'),
    HeaderTabModel(title: 'Projects'),
    HeaderTabModel(title: 'Contact'),
  ];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            tabList.length,
            (index) => InkWell(
              onTap: () {
                onTap(index);
              },
              child: Container(
                margin: Dimens().edgeInsets(
                    right: Responsive.isMobile(context)
                        ? Dimens().thirty
                        : Dimens().thirty),
                child: HoverText(
                  text: tabList[index].title,
                  normalStyle: Styles.mediumWhite20,
                  hoverStyle: Styles.mediumSecondryPrimary20,
                  isSelected: selectedIndex == index,
                ),
              ),
            ),
          ).toList(),
        ),
      );
}

class HeaderTabModel {
  HeaderTabModel({
    required this.title,
  });

  final String title;
}
