import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/text_filelds/search_textfield.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(color: ColorConstants.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const SearchTextFieldWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: FloatingActionButton(
                  onPressed: () {
                    NavigatorManager.instance.pushToPage(NavigateRoutes.search);
                  },
                  child: const Icon(
                    Icons.tune_outlined,
                    size: 30,
                    color: ColorConstants.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
