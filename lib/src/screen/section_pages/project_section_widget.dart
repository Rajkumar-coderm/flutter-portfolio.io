import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/src/src.dart';

class ProjectSectionWidget extends StatefulWidget {
  const ProjectSectionWidget({super.key});

  @override
  State<ProjectSectionWidget> createState() => _ProjectSectionWidgetState();
}

class _ProjectSectionWidgetState extends State<ProjectSectionWidget> {
  CarouselSliderController projectCarouselController =
      CarouselSliderController();

  static final List<ProjectSectionModel> _projectDetailsList = [
    ProjectSectionModel(
      projectName: 'Hospice Care',
      projectDescription: StringConstant.hospiceDes,
      projectImagePath: AssetsConstant.hospiceProjectLogo,
    ),
    ProjectSectionModel(
      projectName: 'Hospice Care',
      projectDescription: StringConstant.hospiceDes,
      projectImagePath: AssetsConstant.hospiceProjectLogo,
    ),
    ProjectSectionModel(
      projectName: 'Hospice Care',
      projectDescription: StringConstant.hospiceDes,
      projectImagePath: AssetsConstant.hospiceProjectLogo,
    ),
  ];

  @override
  Widget build(BuildContext context) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Projects',
                style: Styles.boldSecodry25,
              ),
              Dimens().boxHeight(Dimens().ten),
              Text(
                StringConstant.projectSectionDes,
                style: Responsive.isMobile(context)
                    ? Styles.mediumWhite16
                    : Styles.mediumWhite25,
                textAlign: TextAlign.center,
              ),
              Dimens().boxHeight(Dimens().fifteen),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: Responsive.isMobile(context)
                        ? Dimens().edgeInsetsAll(0)
                        : Dimens().edgeInsetsSymmetric(
                            horizontal: Dimens().eighty,
                          ),
                    child: CarouselSlider.builder(
                      carouselController: projectCarouselController,
                      options: CarouselOptions(
                        height: Dimens().fourHundredFifty,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        autoPlayCurve: Curves.bounceInOut,
                      ),
                      itemBuilder: (context, index, realIndex) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.white,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: Dimens().edgeInsetsAll(Dimens().fifteen),
                              child: SvgPicture.asset(
                                _projectDetailsList[index].projectImagePath,
                                colorFilter: ColorFilter.mode(
                                  Colors.grey.withOpacity(.2),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            Container(
                              padding: Dimens().edgeInsetsAll(Dimens().fifteen),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    _projectDetailsList[index].projectImagePath,
                                    height: Dimens().oneHundredFifty,
                                  ),
                                  Text(
                                    _projectDetailsList[index].projectName,
                                    style: Styles.boldSecodry25,
                                    textAlign: TextAlign.center,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _projectDetailsList[index]
                                          .projectDescription,
                                      style: Styles.mediumBlack18,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: _projectDetailsList.length,
                    ),
                  ),
                  if (!Responsive.isMobile(context)) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RoundedCrouserButton(
                        icon: Icons.chevron_left_outlined,
                        onTap: () async {
                          await projectCarouselController.previousPage(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RoundedCrouserButton(
                        icon: Icons.navigate_next_outlined,
                        onTap: () async {
                          await projectCarouselController.nextPage(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              )
            ],
          ),
        ),
      );
}

class RoundedCrouserButton extends StatelessWidget {
  const RoundedCrouserButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimens().oneHundred),
        splashColor: ColorsValue.color7562E0,
        child: Container(
          padding: Dimens().edgeInsetsAll(Dimens().fifteen),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorsValue.color7562E0,
            ),
            color: ColorsValue.color00ffda,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                // Icons.navigate_next_outlined,
                size: 30,
              ),
            ],
          ),
        ),
      );
}

class ProjectSectionModel {
  ProjectSectionModel({
    required this.projectName,
    required this.projectDescription,
    required this.projectImagePath,
  });

  final String projectName;
  final String projectDescription;
  final String projectImagePath;
}
