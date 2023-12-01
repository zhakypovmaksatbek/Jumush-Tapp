import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/widgets/text_filelds/index.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTextField(
        maxLines: 1,
        hintText: LocaleKeys.general_search.tr(),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
