import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/colors_list.dart';

class ProviderColors extends ChangeNotifier {
  List<ColorsList> colorList = [];

  void fetchColor() {
    colorList.clear();
    colorList.addAll({ColorsList(color: Colors.black)});
    colorList.addAll({ColorsList(color: Colors.red)});
    colorList.addAll({ColorsList(color: Colors.green)});
    colorList.addAll({ColorsList(color: Colors.blue)});
    colorList.addAll({ColorsList(color: Colors.yellow)});
    colorList.addAll({ColorsList(color: Colors.grey)});
    colorList.addAll({ColorsList(color: Colors.teal)});
    colorList.addAll({ColorsList(color: Colors.orange)});
    colorList.addAll({ColorsList(color: Colors.purple)});
    colorList.addAll({ColorsList(color: Colors.pink)});
    colorList.addAll({ColorsList(color: Colors.black)});
    colorList.addAll({ColorsList(color: Colors.red)});
    colorList.addAll({ColorsList(color: Colors.green)});
    colorList.addAll({ColorsList(color: Colors.blue)});
    colorList.addAll({ColorsList(color: Colors.yellow)});
    colorList.addAll({ColorsList(color: Colors.grey)});
    colorList.addAll({ColorsList(color: Colors.teal)});
    colorList.addAll({ColorsList(color: Colors.orange)});
    colorList.addAll({ColorsList(color: Colors.purple)});
    colorList.addAll({ColorsList(color: Colors.pink)});

    notifyListeners();
  }
}
