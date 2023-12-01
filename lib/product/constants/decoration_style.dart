// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DecorationStyle {
  final BuildContext context;
  DecorationStyle({
    required this.context,
  });
  BoxDecoration get defaultBoxDecoration => BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
      );
}
