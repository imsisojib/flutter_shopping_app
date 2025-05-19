import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/category.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ProviderCategories extends ChangeNotifier {
  List<Category> categories = [];

  void fetchCategories() {
    categories.clear();
    categories.add(Category(title: "New", imagePath: AppImages.blackDress));
    categories.add(Category(title: "Cloths", imagePath: AppImages.banner));
    categories.add(Category(title: "Cloths", imagePath: AppImages.blackDress2));
    categories.add(Category(title: "Shoes", imagePath: AppImages.blackDress));
    categories
        .add(Category(title: "Assesories", imagePath: AppImages.streetCloths));
    notifyListeners();
  }
}
