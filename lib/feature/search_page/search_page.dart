import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/vacancy_provider.dart';
import 'package:jumush_tapp/feature/detail/index.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/general_functions.dart';
import 'package:jumush_tapp/product/constants/image_constants.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';
import 'package:jumush_tapp/product/widgets/vacancy_card.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<VacancyProvider>(context, listen: false).onPressCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TitleText(title: LocaleKeys.general_search.tr()),
        ),
        body: Consumer<VacancyProvider>(
            builder: (context, provider, child) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: GeneralFunction.categoryMap.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cardData = GeneralFunction.categoryMap.keys
                                .elementAt(index);
                            final icon = GeneralFunction.categoryMap[cardData];

                            return categoryCard(
                                provider, index, context, icon, cardData);
                          },
                        ),
                      ),
                      const SizedBox(height: ProjectSizes.middleSize),
                      provider.jobs == null || provider.jobs!.isEmpty
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(LocaleKeys.not_found.tr()),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: provider.jobs!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final job = provider.jobs![index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(job: job),
                                        ),
                                      );
                                    },
                                    child: VacancyCard(
                                      titleJob: job.titleJob ?? "",
                                      salary: job.salary ?? "",
                                      description: job.description ?? "",
                                      location: job.location ?? "",
                                      nameOrganization: job.nameOrganization!,
                                      direction: job.direction ?? "",
                                      whenShare:
                                          GeneralFunction.formatShareDate(
                                              job.whenShare!),
                                    ),
                                  );
                                },
                              ),
                            )
                    ],
                  ),
                )));
  }

  Padding categoryCard(
    VacancyProvider provider,
    int index,
    BuildContext context,
    IconData? icon,
    String cardData,
  ) {
    return Padding(
      padding: const ProjectPadding.horizontal(),
      child: GestureDetector(
        onTap: () {
          // provider.selectCategory(index);
          provider.selectCategory(index);
          provider.onPressCategoryList();
        },
        child: Card(
          elevation: provider.isSelected(index) ? 1 : 4,
          color: provider.isSelected(index)
              ? ColorConstants.blue
              : ColorConstants.white,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      ImagesEnum.background.path,
                    ))),
            width: MediaQuery.of(context).size.width * .4,
            padding: const EdgeInsets.all(3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.white,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: ColorConstants.blue,
                  ),
                ),
                DefaultText(
                  title: cardData,
                  color: provider.isSelected(index)
                      ? ColorConstants.white
                      : ColorConstants.black,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
