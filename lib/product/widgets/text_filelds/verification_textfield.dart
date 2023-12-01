import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/constants/project_paddings.dart';
import 'package:jumush_tapp/product/constants/project_sizes.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({
    Key? key,
    this.onSaved,
    required this.controller,
    this.onChanged,
  }) : super(key: key);
  final void Function(String?)? onSaved;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ProjectSizes.xlSize,
      height: ProjectSizes.xlSize,
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        // textInputAction: TextInputAction.next,
        onChanged: onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: ColorConstants.iconColor, fontWeight: FontWeight.w800),
        decoration: InputDecoration(
          contentPadding: const ProjectPadding.symmetric(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ProjectSizes.radius),
            borderSide: const BorderSide(
                width: 1,
                color: ColorConstants
                    .blue), // Buradaki renk istediğiniz renk olabilir
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ProjectSizes.radius),
              borderSide: const BorderSide(color: ColorConstants.iconColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
