import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/theme/project_theme.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:provider/provider.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.title,
    this.color,
    this.textColor,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ProjectTheme>();

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.3,
          backgroundColor: color ?? ColorConstants.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8.0), // Köşe yarıçapını istediğiniz değere ayarlayın
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: DefaultText(
              title: title,
              color: textColor ??
                  (themeProvider.lightMode
                      ? ColorConstants.white
                      : ColorConstants.black),
            ),
          ),
        ));
  }
}
