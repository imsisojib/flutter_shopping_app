import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/women_tops_list.dart';

class ProviderWomenTopsList extends ChangeNotifier {
  List<WomenTopsList> womenTopsList = [];

  void fetchWomenTopsList() {
    womenTopsList.clear();
    womenTopsList.add(WomenTopsList(
      title: "T-shirts",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Crop tops",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Sleeveless",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Blouses",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Shirt",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Pullover",
    ));
    womenTopsList.add(WomenTopsList(
      title: "T-shirts",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Crop tops",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Sleeveless",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Blouses",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Shirt",
    ));
    womenTopsList.add(WomenTopsList(
      title: "Pullover",
    ));

    notifyListeners();
  }
}
