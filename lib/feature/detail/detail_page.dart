// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/constants/general_functions.dart';
import 'package:jumush_tapp/product/model/job_model.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/title_text.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.job});

  final Job job;
  DetailPage copyWith({Job? job}) {
    return DetailPage(
      job: job ?? this.job,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: LocaleKeys.project_name.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: TitleText(
                            title: job.titleJob ?? LocaleKeys.not_found.tr(),
                            color: ColorConstants.blue,
                          ),
                        ),
                        DefaultText(
                            title: job.salary ?? LocaleKeys.not_found.tr()),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: DefaultText(title: job.location!)),
                        DefaultText(title: job.direction!)
                      ],
                    ),
                    DefaultText(
                        title: GeneralFunction.formatShareDate(job.whenShare!))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MyContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(title: "${LocaleKeys.register_company.tr()}:"),
                  DefaultText(
                    title: job.nameOrganization ?? LocaleKeys.not_found.tr(),
                    color: ColorConstants.blue,
                  ),
                ],
              )),
              const SizedBox(height: 10),
              MyContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(title: LocaleKeys.general_responsibilities.tr()),
                  DefaultText(
                      title: job.requirement ?? LocaleKeys.not_found.tr()),
                  const SizedBox(height: 20),
                  TitleText(title: LocaleKeys.general_requirements.tr()),
                  DefaultText(
                      title: job.description ?? LocaleKeys.not_found.tr()),
                  const SizedBox(height: 20),
                  TitleText(title: LocaleKeys.general_contacts.tr()),
                  Row(
                    children: [
                      DefaultText(title: job.fullName!),
                      const SizedBox(width: 10),
                      SelectableText(
                        job.phone!,
                        style: const TextStyle(color: ColorConstants.blue),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? Theme.of(context).colorScheme.background),
      child: child,
    );
  }
}
