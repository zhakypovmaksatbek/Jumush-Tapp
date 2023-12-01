import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/project_sizes.dart';

class ProjectPadding extends EdgeInsets {
  const ProjectPadding.all() : super.all(ProjectSizes.defaultSize);
  const ProjectPadding.onlyRight()
      : super.only(right: ProjectSizes.defaultSize);
  const ProjectPadding.horizontal()
      : super.symmetric(horizontal: ProjectSizes.defaultSize);
  const ProjectPadding.vertical()
      : super.symmetric(vertical: ProjectSizes.defaultSize);
  const ProjectPadding.symmetric()
      : super.symmetric(
            horizontal: ProjectSizes.middleSize,
            vertical: ProjectSizes.middleSize);
}
