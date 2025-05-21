import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/all_category_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/category.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ProviderAllCategoryList extends ChangeNotifier {
  List<AllCategoryList> allCategories = [];

  void fetchAllCategories() {
    allCategories.clear();
    allCategories.add(AllCategoryList(
      title: "Tops",
    ));
    allCategories.add(AllCategoryList(
      title: "Shirts & Blouses",
    ));
    allCategories.add(AllCategoryList(
      title: "Cardigans & Sweaters",
    ));
    allCategories.add(AllCategoryList(
      title: "Blazers",
    ));
    allCategories.add(AllCategoryList(
      title: "Outerwear",
    ));
    allCategories.add(AllCategoryList(
      title: "Pants",
    ));
    allCategories.add(AllCategoryList(
      title: "Jeans",
    ));
    allCategories.add(AllCategoryList(
      title: "Shorts",
    ));
    allCategories.add(AllCategoryList(
      title: "Skirts",
    ));
    allCategories.add(AllCategoryList(
      title: "Dresses",
    ));
    notifyListeners();
  }
}
