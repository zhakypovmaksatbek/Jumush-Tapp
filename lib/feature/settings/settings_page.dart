import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/index.dart';
import 'package:jumush_tapp/feature/settings/settings_mixin.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/theme/project_theme.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SettingsMixin {
  @override
  void initState() {
    context.read<VacancyProvider>().loadSelectedLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VacancyProvider>();
    final themeProvider = context.watch<ProjectTheme>();
    return Scaffold(
      appBar: AppBar(
        title: TitleText(title: LocaleKeys.settings.tr()),
        leading: IconButton(
            onPressed: () {
              NavigatorManager.instance
                  .pushTopageReplacementNamed(NavigateRoutes.home);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const ProjectPadding.symmetric(),
          child: Column(
            children: [
              _dropDownLanguage(provider),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultText(
                    title: "Light Mode",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Switch.adaptive(
                    value: themeProvider.lightMode,
                    onChanged: (value) {
                      themeProvider.changeTheme(value);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _dropDownLanguage(VacancyProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const DefaultText(
          title: "Languages",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        DropdownButton<String>(
          dropdownColor: Theme.of(context).colorScheme.background,
          iconDisabledColor: ColorConstants.defaultGrey,
          iconEnabledColor: ColorConstants.defaultGrey,
          underline: const SizedBox(),
          elevation: 0,
          value: provider.selectedLanguage,
          onChanged: (String? newValue) async {
            if (newValue != null) {
              provider.onChangedLanguage(newValue);
              selectedLanguage(newValue);
              await provider.saveSelectedLanguage(newValue);
            }
          },
          items: items,
        ),
      ],
    );
  }
}
