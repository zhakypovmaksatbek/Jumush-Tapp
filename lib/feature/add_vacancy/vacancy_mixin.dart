import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/model/category_model.dart';

mixin VacancyMixin {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String? validateGeneral(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return LocaleKeys.exceptions_cannot_be_left_blank.tr();
    } else if (passNonNullValue.length < 2) {
      return LocaleKeys.register_min_character.tr();
    }
    return null;
  }

  Future<List<Categories>> fetchCategory() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categories').get();
    List<Categories> categoryList = [];
    for (var doc in querySnapshot.docs) {
      categoryList.add(Categories.fromJson(doc.data() as Map<String, dynamic>));
    }
    return categoryList;
  }
}
