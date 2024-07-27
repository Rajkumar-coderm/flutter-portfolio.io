import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class ProjectSectionWidget extends StatelessWidget {
  const ProjectSectionWidget({super.key});

  static final List<ProjectSectionModel> _projectDetailsList = [
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
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: Responsive.isWeb(context)
                      ? 4
                      : Responsive.isTablet(context)
                          ? 2
                          : 1,
                  crossAxisSpacing: Responsive.isMobile(context) ||
                          Responsive.isTablet(context)
                      ? Dimens().ten
                      : Dimens().thirtyFive,
                  mainAxisSpacing: Responsive.isMobile(context) ||
                          Responsive.isTablet(context)
                      ? Dimens().ten
                      : Dimens().thirtyFive,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  children: List.generate(
                    _projectDetailsList.length,
                    (index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HoverFlipImage(
                          description:
                              _projectDetailsList[index].projectDescription,
                          frontImageUrl:
                              _projectDetailsList[index].projectImagePath,
                          projectName: _projectDetailsList[index].projectName,
                        ),
                      ],
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
