// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/constants/project_paddings.dart';
import 'package:jumush_tapp/product/constants/project_sizes.dart';

class MyDropDownButton extends StatelessWidget {
  const MyDropDownButton(
      {Key? key, required this.items, this.value, this.onChanged})
      : super(key: key);
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    // final provider = context.watch<VacancyProvider>();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.grey),
          borderRadius: BorderRadius.circular(ProjectSizes.radius)),
      child: DropdownButton<String>(
          elevation: 0,
          underline: const SizedBox(),
          padding: const ProjectPadding.horizontal(),
          isExpanded: true,
          style: Theme.of(context).textTheme.bodyMedium,
          value: value,
          borderRadius: BorderRadius.circular(ProjectSizes.radius),
          dropdownColor: Theme.of(context).colorScheme.background,
          items: items,
          onChanged: onChanged),
    );
  }
}
