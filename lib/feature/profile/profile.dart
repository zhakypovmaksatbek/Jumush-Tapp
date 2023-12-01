// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/auth/view/sign_in.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:jumush_tapp/feature/detail/detail_page.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/model/job_model.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/buttons/my_elevated_button.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';
import 'package:jumush_tapp/services/job_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthViewModel>();

    return provider.user == null
        ? const SignIn()
        : Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () {
                  NavigatorManager.instance.pushToPage(NavigateRoutes.home);
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    provider.signOut();
                    NavigatorManager.instance
                        .pushTopageReplacementNamed(NavigateRoutes.home);
                  },
                  child: DefaultText(
                    title: LocaleKeys.log_out.tr(),
                    color: ColorConstants.blue,
                  ),
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: provider.user == null
                ? null
                : Container(
                    padding: const ProjectPadding.horizontal(),
                    height: 60,
                    child: MyElevatedButton(
                        textColor: ColorConstants.white,
                        onTap: () {
                          NavigatorManager.instance
                              .pushToPage(NavigateRoutes.vacancy);
                        },
                        color: ColorConstants.blue,
                        title: LocaleKeys.register_add_vacancy.tr()),
                  ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const ProjectPadding.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(title: LocaleKeys.profile.tr()),
                    const SizedBox(height: ProjectSizes.largeSize),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(title: LocaleKeys.general_vacancies.tr()),
                        DefaultText(
                            title: provider.user?.jobCount == null
                                ? '0'
                                : " ${provider.user?.jobCount}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(title: LocaleKeys.register_email.tr()),
                        DefaultText(title: provider.user!.email!),
                      ],
                    ),
                    const SizedBox(height: ProjectSizes.xlSize),
                    const UserJobsList(),
                  ],
                ),
              ),
            ),
          );
  }
}

class UserJobsList extends StatefulWidget {
  const UserJobsList({super.key});

  @override
  State<UserJobsList> createState() => _UserJobsListState();
}

class _UserJobsListState extends State<UserJobsList> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthViewModel>();

    final jobService = JobService();

    return FutureBuilder(
      future: jobService
          .getJobsByUser(provider.user!.userID!), // Kullanıcının UID'sini geçin
      builder: (context, AsyncSnapshot<List<Job>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text(
              '${LocaleKeys.exceptions_exceptions.tr()} ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text(LocaleKeys.does_not_have_vacancy.tr());
        } else {
          List<Job> userJobs = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(title: LocaleKeys.my_vacancy.tr()),
              const SizedBox(height: ProjectSizes.middleSize),
              SizedBox(
                height: MediaQuery.of(context).size.height * .49,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userJobs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            userJobs[index].titleJob ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog.adaptive(
                                      content: const DefaultText(
                                          title:
                                              "Siz jaryianyzdy ochurup jatasyz!"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const DefaultText(
                                              title: "Cancel",
                                              color: ColorConstants.blue,
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              provider.updateJobs(
                                                  userJobs[index].jobID!);
                                              Navigator.pop(context);
                                            },
                                            child: const DefaultText(
                                              title: "Delete",
                                              color: ColorConstants.blue,
                                            ))
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: ColorConstants.defaultGrey,
                              )),
                          subtitle: DefaultText(
                            title:
                                "${userJobs[index].nameOrganization} / ${userJobs[index].location} / ${userJobs[index].salary}",
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(job: userJobs[index]),
                            ));
                          },
                        ),
                        const Divider(
                          color: ColorConstants.grey,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
