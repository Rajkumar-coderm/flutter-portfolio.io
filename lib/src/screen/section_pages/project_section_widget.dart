import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rajkumar_portfolio/src/src.dart';

class ProjectSectionWidget extends StatelessWidget {
  const ProjectSectionWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: ListView(
          children: [
            Text(
              'Projects:',
              style: Styles.boldSecodry25,
            ),
            Dimens().boxHeight(Dimens().ten),
            Text(
              'I have worked on many projects over the course of being a Web Developer, here are a few of my live, real-world projects',
              style: Styles.mediumWhite25,
            ),
            Dimens().boxHeight(Dimens().fifteen),
            StaggeredGrid.count(
                crossAxisCount: 3,
                crossAxisSpacing: Dimens().thirty,
                mainAxisSpacing: Dimens().thirty,
                children: List.generate(
                  2,
                  (index) => Container(
                    height: Dimens().threeHundred,
                    width: Dimens().threeHundred,
                    color: ColorsValue.color00ffda,
                    child: const Column(
                      children: [Text('')],
                    ),
                  ),
                ))
          ],
        ),
      );
}
