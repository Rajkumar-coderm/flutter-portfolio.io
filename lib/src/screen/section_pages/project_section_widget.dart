import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class ProjectSectionWidget extends StatelessWidget {
  const ProjectSectionWidget({super.key});

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
              SizedBox(
                width:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? Dimens().percentWidth(1)
                        : Dimens().percentWidth(.65),
                height: Dimens().fiveHundred,
                child: CarouselView(
                  padding: Dimens().edgeInsets(
                    left: Dimens().eighteen,
                  ),
                  itemExtent: Dimens().fourHundred,
                  shrinkExtent: 300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  itemSnapping: true,
                  children: List.generate(
                    _projectDetailsList.length,
                    (index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.white,
                      child: Container(
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
                            ),
                            Flexible(
                              child: Text(
                                _projectDetailsList[index].projectDescription,
                                style: Styles.mediumBlack18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
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
