import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/general_functions.dart';
import 'package:jumush_tapp/product/model/category_model.dart';
import 'package:jumush_tapp/product/model/job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VacancyProvider extends ChangeNotifier {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String? direction,
      nameOrganization,
      location,
      phoneNumber,
      fullName,
      titleJob,
      employmentTime,
      salary,
      requirement,
      description;

  String selectedItem = "IT, компьютеры, связь";
  String selectedCity = "Bishkek";
  String selectedLanguage = 'Русский';

  void onChangedItem(String? newValue) {
    selectedItem = newValue!;

    notifyListeners();
  }

  //Tildi ozgortuu metodu
  void onChangedLanguage(String? newValue) {
    selectedLanguage = newValue!;
    notifyListeners();
  }

  Future<void> loadSelectedLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedLanguage = prefs.getString('selectedLanguage');

    if (storedLanguage != null) {
      selectedLanguage = storedLanguage;
      notifyListeners();
    }
  }

  Future<void> saveSelectedLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedLanguage', language.toString());
  }

  void onChangedCity(String? newValue) {
    selectedCity = newValue!;
    notifyListeners();
  }

  Future<List<Categories>> fetchCategory() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categaries').get();
    List<Categories> categoryList = [];
    for (var doc in querySnapshot.docs) {
      categoryList.add(Categories.fromJson(doc.data() as Map<String, dynamic>));
    }
    return categoryList;
  }

  //Search barakchasyndagy methoddor

  int selectedIdx = -1;

  List<Job>? jobs;
  bool isSelected(int index) {
    return index == selectedIdx;
  }

  void selectCategory(int index) {
    selectedIdx = isSelected(index) ? -1 : index;
    notifyListeners();
  }

  List<String>? selectedCategoryList;

  Future<void> onPressCategoryList() async {
    // Eğer selectedIdx geçerli bir kategori seçmişse
    if (selectedIdx != -1) {
      final selectedCategoryList =
          GeneralFunction.categoryMap.keys.elementAt(selectedIdx);
      final String categoryName = selectedCategoryList;

      // Seçilen kategoriye ait verileri getir ve jobs listesini güncelle
      jobs = await getJobsInCategory(categoryName);
    } else {
      // Eğer selectedIdx -1 ise (hiçbir kategori seçilmemişse), ilk kategoriye ait verileri getir
      final String firstCategoryName = GeneralFunction.categoryMap.keys.first;
      jobs = await getJobsInCategory(firstCategoryName);
    }

    notifyListeners();
  }

  Future<List<Job>> fetchData() async {
    await onPressCategoryList(); // onPressCategoryList fonksiyonunu çağır
    return jobs ?? [];
    // jobs null ise boş bir liste döndür
  }

  Future<List<Job>> getJobsInCategory(String categoryName) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('jobs')
        .where('direction', isEqualTo: categoryName)
        .get();

    return snapshot.docs.map((doc) => Job.fromJson(doc.data())).toList();
  }
}
