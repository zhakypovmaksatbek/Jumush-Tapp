// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/index.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.maxLines,
    this.onSaved,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.obscureText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String? p1)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      onSaved: onSaved,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        contentPadding: const ProjectPadding.symmetric(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ProjectSizes.radius),
          borderSide: const BorderSide(
              width: 1.5,
              color: ColorConstants
                  .blue), // Buradaki renk istediğiniz renk olabilir
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ProjectSizes.radius),
            borderSide: const BorderSide(color: ColorConstants.grey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
