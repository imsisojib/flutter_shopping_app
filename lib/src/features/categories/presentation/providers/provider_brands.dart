import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/brand_list.dart';

class ProviderBrands extends ChangeNotifier {
  List<BrandList> brands = [];

  void fetchBrands() {
    brands.clear();
    brands.add(BrandList(
      name: "adidas",
    ));
    brands.add(BrandList(
      name: "adidas Originals",
    ));
    brands.add(BrandList(
      name: "Blend",
    ));
    brands.add(BrandList(
      name: "Boutique Moschino",
    ));
    brands.add(BrandList(
      name: "Champion",
    ));
    brands.add(BrandList(
      name: "Diesel",
    ));
    brands.add(BrandList(
      name: "Jack & Jones",
    ));
    brands.add(BrandList(
      name: "Naf Naf",
    ));
    brands.add(BrandList(
      name: "Red Valentino",
    ));
    brands.add(BrandList(
      name: "s.Oliver",
    ));

    notifyListeners();
  }
}
