// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/detail/index.dart';
import 'package:jumush_tapp/feature/home/home_mixin.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/general_functions.dart';
import 'package:jumush_tapp/product/constants/image_constants.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/drawer/my_drawer.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';
import 'package:jumush_tapp/product/widgets/vacancy_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesEnum.logo3.path,
              height: 23,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 5,
            ),
            DefaultText(
              title: LocaleKeys.project_name.tr(),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                NavigatorManager.instance.pushToPage(NavigateRoutes.search);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: const MyDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            //Eger ekrandyn en aiagyna jetken bolso jany datalardy jukto
            getJobs();
          }
          return true;
        },
        child: ListView.builder(
          itemCount: jobs.length + 1,
          itemBuilder: (context, index) {
            if (index == jobs.length) {
              return _buildProgressIndicator();
            } else {
              final vacancy = jobs[index];

              return Padding(
                padding: const ProjectPadding.horizontal(),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(job: vacancy),
                        ));
                  },
                  child: VacancyCard(
                      nameOrganization: vacancy.nameOrganization!,
                      location: vacancy.location!,
                      titleJob: vacancy.titleJob!,
                      direction: vacancy.direction!,
                      whenShare:
                          GeneralFunction.formatShareDate((vacancy.whenShare!)),
                      salary: vacancy.salary ?? LocaleKeys.not_found.tr(),
                      description: vacancy.description!),
                ),
              );
            }
          },
          physics: const AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return loading
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : Container();
  }
}
