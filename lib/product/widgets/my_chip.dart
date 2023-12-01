import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/decoration_style.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/index.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    Key? key,
    required this.cardData,
    this.onTap,
  }) : super(key: key);

  final String cardData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.horizontal(),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 4,
          child: Container(
            width: MediaQuery.of(context).size.width * .4,
            padding: const ProjectPadding.symmetric(),
            decoration: DecorationStyle(context: context)
                .defaultBoxDecoration
                .copyWith(color: ColorConstants.blue),
            child: Align(
              alignment: Alignment.center,
              child: DefaultText(
                title: cardData,
                color: ColorConstants.white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
