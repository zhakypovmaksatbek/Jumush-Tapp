// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/vacancy_mixin.dart';
import 'package:jumush_tapp/feature/add_vacancy/vacancy_provider.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/model/category_model.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/drop_down/my_dropdown.dart';
import 'package:jumush_tapp/product/widgets/text_filelds/index.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';
import 'package:provider/provider.dart';

class AddVacancies extends StatefulWidget {
  const AddVacancies({Key? key}) : super(key: key);

  @override
  State<AddVacancies> createState() => _AddVacanciesState();
}

class _AddVacanciesState extends State<AddVacancies> with VacancyMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<VacancyProvider>(builder: (context, provider, child) {
      final provider = context.watch<VacancyProvider>();
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            TextButton(
                onPressed: () {
                  globalKey.currentState!.save();
                  if (globalKey.currentState!.validate()) {
                    NavigatorManager.instance.pushToPage(
                      NavigateRoutes.result,
                    );
                  }
                  return;
                },
                child: DefaultText(
                  title: LocaleKeys.register_publish.tr(),
                  color: ColorConstants.blue,
                ))
          ],
        ),
        body: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const ProjectPadding.symmetric(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: LocaleKeys.register_add_vacancy.tr()),
                  const SizedBox(height: ProjectSizes.middleSize),
                  //Направления
                  DefaultText(
                    title: "${LocaleKeys.general_category.tr()} *",
                    color: ColorConstants.defaultGrey,
                  ),
                  FutureBuilder<List<Categories>>(
                    future: fetchCategory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Categories> categoryList = snapshot.data ?? [];

                        return MyDropDownButton(
                            value: provider.selectedItem,
                            onChanged: (newValue) {
                              provider.onChangedItem(newValue);
                            },
                            items: categoryList.map((Categories category) {
                              return DropdownMenuItem<String>(
                                value: category.name,
                                child: Text(
                                    category.name ?? LocaleKeys.not_found.tr()),
                              );
                            }).toList());
                      }
                    },
                  ),

                  // Titli job
                  const SizedBox(height: ProjectSizes.middleSize),
                  NewtextField(
                      onSaved: (newValue) {
                        provider.titleJob = newValue;
                      },
                      validator: validateGeneral,
                      nameTextField: LocaleKeys.register_title_job.tr()),
                  // Name organization
                  NewtextField(
                      validator: validateGeneral,
                      onSaved: (newValue) {
                        provider.nameOrganization = newValue;
                      },
                      nameTextField: LocaleKeys.register_name_company.tr()),

                  //Location
                  const SizedBox(height: ProjectSizes.middleSize),
                  NewtextField(
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (newValue) {
                        provider.location = newValue;
                      },
                      validator: validateGeneral,
                      nameTextField:
                          "${LocaleKeys.register_location_work.tr()} *"),

                  // Salary
                  const SizedBox(height: ProjectSizes.middleSize),
                  NewtextField(
                      onSaved: (newValue) {
                        provider.salary = newValue;
                      },
                      nameTextField: LocaleKeys.general_salary.tr()),

                  //Phone Number
                  const SizedBox(height: ProjectSizes.middleSize),
                  NewtextField(
                      validator: validateGeneral,
                      onSaved: (newValue) {
                        provider.phoneNumber = newValue;
                      },
                      nameTextField: LocaleKeys.register_phone_number.tr()),

                  //Full Name
                  const SizedBox(height: ProjectSizes.middleSize),

                  NewtextField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: validateGeneral,
                      onSaved: (newValue) {
                        provider.fullName = newValue;
                      },
                      nameTextField: LocaleKeys.register_full_name.tr()),
                  const SizedBox(height: ProjectSizes.middleSize),

                  //Требование
                  DefaultText(
                    title: LocaleKeys.general_requirements.tr(),
                    color: ColorConstants.defaultGrey,
                  ),
                  DefaultTextField(
                    onSaved: (newValue) {
                      provider.requirement = newValue;
                    },
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.unspecified,
                  ),
                  //Description
                  const SizedBox(height: ProjectSizes.middleSize),

                  DefaultText(
                      title:
                          "${LocaleKeys.register_description_vacancy.tr()} *",
                      color: ColorConstants.defaultGrey),
                  DefaultTextField(
                    onSaved: (newValue) {
                      provider.description = newValue;
                    },
                    validator: validateGeneral,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.unspecified,
                  ),
                  const SizedBox(
                    height: ProjectSizes.middleSize,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
