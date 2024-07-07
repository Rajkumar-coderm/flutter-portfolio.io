import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class ProjectSectionWidget extends StatelessWidget {
  const ProjectSectionWidget({super.key});

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
              StaggeredGrid.count(
                  crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
                  crossAxisSpacing: Dimens().thirty,
                  mainAxisSpacing: Dimens().thirty,
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: Dimens().threeHundred,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsValue.color7562E0),
                        borderRadius: BorderRadius.circular(Dimens().twelve),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: Dimens().edgeInsetsAll(Dimens().three),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimens().twelve),
                                topRight: Radius.circular(Dimens().twelve),
                              ),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhWfHENb24mzvQcymkQ9grDzRkjH19sWjGHA&s',
                                height: Dimens().twoHundredFifty,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: Dimens().edgeInsetsSymmetric(
                              horizontal: Dimens().fifteen,
                              vertical: Dimens().ten,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hospice',
                                  style: Styles.mediumWhite25.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                ReadMoreTextWidget(
                                  'I worked on a transformative project in hospice care, focused on enhancing patient comfort and improving healthcare delivery. This project involved the integration of advanced technologies to streamline workflows, enhance patient monitoring, and provide holistic support for terminally ill patients. By collaborating with healthcare professionals, I contributed to the development of a compassionate care model that prioritizes patient dignity and quality of life.',
                                  textStyle: Styles.mediumLightGrey14,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
}
