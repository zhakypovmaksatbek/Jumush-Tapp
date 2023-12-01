// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/decoration_style.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/widgets/company_info.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/title_text.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({
    Key? key,
    required this.nameOrganization,
    required this.location,
    required this.titleJob,
    required this.direction,
    required this.whenShare,
    required this.salary,
    required this.description,
  }) : super(key: key);
  final String nameOrganization;
  final String location;
  final String titleJob;
  final String direction;
  final String whenShare;
  final String salary;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: DecorationStyle(context: context).defaultBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TitleText(title: titleJob)),
                Text(salary)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(description,
                  overflow: TextOverflow.ellipsis, maxLines: 2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CompanyInfo(
                  nameOrganization: nameOrganization,
                  location: location,
                  direction: direction,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: DefaultText(title: whenShare),
                )
              ],
            ),
            const SizedBox(
              height: ProjectSizes.middleSize,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
