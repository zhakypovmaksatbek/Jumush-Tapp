// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/vacancy_mixin.dart';
import 'package:jumush_tapp/feature/add_vacancy/vacancy_provider.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/model/job_model.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/buttons/index.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';
import 'package:jumush_tapp/services/job_service.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with VacancyMixin {
  @override
  Widget build(BuildContext context) {
    final viewModelProvider = context.watch<AuthViewModel>();

    return Consumer<VacancyProvider>(builder: (context, provider, child) {
      final newJob = Job(
          direction: provider.selectedItem,
          titleJob: provider.titleJob,
          nameOrganization: provider.nameOrganization,
          location: provider.location,
          phone: provider.phoneNumber,
          fullName: provider.fullName,
          salary: provider.salary,
          requirement: provider.requirement,
          description: provider.description,
          whenShare: DateTime.now(),
          userID: viewModelProvider.user!.userID!);

      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            padding: const ProjectPadding.horizontal(),
            height: 60,
            child: MyElevatedButton(
                textColor: ColorConstants.white,
                onTap: () {
                  JobService().addJob(
                      newJob, viewModelProvider.user!.userID.toString());
                  NavigatorManager.instance
                      .pushTopageReplacementNamed(NavigateRoutes.home);
                },
                color: ColorConstants.blue,
                title: LocaleKeys.register_publish.tr()),
          ),
          appBar: AppBar(
            forceMaterialTransparency: true,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: TitleText(title: LocaleKeys.last_check.tr()),
            actions: [
              IconButton.outlined(
                  color: ColorConstants.blue,
                  style: const ButtonStyle(
                      side: MaterialStatePropertyAll(
                          BorderSide(color: ColorConstants.blue))),
                  splashColor: ColorConstants.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: ColorConstants.blue,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const ProjectPadding.symmetric(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ResultTextCard(
                    title: LocaleKeys.register_title_job.tr(),
                    description: provider.titleJob!,
                  ),
                  _ResultTextCard(
                    title: LocaleKeys.general_category.tr(),
                    description: provider.selectedItem,
                  ),
                  _ResultTextCard(
                    title: LocaleKeys.register_name_company.tr(),
                    description: provider.nameOrganization!,
                  ),
                  _ResultTextCard(
                    title: LocaleKeys.register_location_work.tr(),
                    description: provider.location!,
                  ),
                  _ResultTextCard(
                    title: LocaleKeys.general_salary.tr(),
                    description: provider.salary ?? LocaleKeys.no_info.tr(),
                  ),
                  _ResultTextCard(
                    title: LocaleKeys.general_requirements.tr(),
                    description:
                        provider.requirement ?? LocaleKeys.no_info.tr(),
                  ),
                  _ResultTextCard(
                    title: LocaleKeys.register_description_vacancy.tr(),
                    description:
                        provider.description ?? LocaleKeys.no_info.tr(),
                  ),
                  _ResultTextCard(
                      title: LocaleKeys.register_contact_person.tr(),
                      description:
                          "${provider.phoneNumber ?? LocaleKeys.no_info.tr()}  ${provider.fullName ?? LocaleKeys.no_info.tr()}"),
                  const SizedBox(height: ProjectSizes.xlSize),
                ],
              ),
            ),
          ));
    });
  }
}

class _ResultTextCard extends StatelessWidget {
  const _ResultTextCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: ProjectSizes.middleSize),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ProjectSizes.radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
              title: title,
              color: ColorConstants.defaultGrey,
            ),
            DefaultText(
              title: description,
              color: ColorConstants.blue,
            ),
          ],
        ),
      ),
    );
  }
}
