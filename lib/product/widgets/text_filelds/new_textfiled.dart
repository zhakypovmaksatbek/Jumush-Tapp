// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/widgets/text_filelds/default_textfield.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';

class NewtextField extends StatelessWidget {
  const NewtextField({
    Key? key,
    required this.nameTextField,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.obscureText,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);
  final String nameTextField;
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
    return Padding(
      padding: const ProjectPadding.vertical(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            title: nameTextField,
            color: ColorConstants.defaultGrey,
          ),
          DefaultTextField(
              onChanged: onChanged,
              onSaved: onSaved,
              maxLines: 1,
              hintText: hintText,
              keyboardType: keyboardType,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              textInputAction: textInputAction,
              obscureText: obscureText ?? false,
              controller: controller,
              validator: validator),
        ],
      ),
    );
  }
}
