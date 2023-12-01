import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/buttons/my_elevated_button.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.linear,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              children: [
                MyElevatedButton(
                    textColor: ColorConstants.iconColor,
                    title: LocaleKeys.profile.tr(),
                    onTap: () {
                      NavigatorManager.instance
                          .pushToPage(NavigateRoutes.profile);
                    }),
                const SizedBox(height: 10),
                MyElevatedButton(
                  title: LocaleKeys.general_post_vacancies.tr(),
                  onTap: () {
                    NavigatorManager.instance
                        .pushToPage(NavigateRoutes.landing);
                  },
                  textColor: ColorConstants.white,
                  color: ColorConstants.blue,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(LocaleKeys.general_search.tr()),
            onTap: () {
              NavigatorManager.instance.pushToPage(NavigateRoutes.search);
            },
          ),
          ListTile(
            title: Text(LocaleKeys.settings.tr()),
            onTap: () {
              NavigatorManager.instance
                  .pushToPage(NavigateRoutes.settings); // Drawer'ı kapat
            },
          ),
        ],
      ),
    );
  }
}
