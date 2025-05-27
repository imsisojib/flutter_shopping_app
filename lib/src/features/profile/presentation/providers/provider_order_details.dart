import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/order_details_data.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ProviderOrderDetails extends ChangeNotifier {
  List<OrderDetailsData> orderDetailsData = [];

  void fetchOrderDetailsData() {
    orderDetailsData.clear();

    orderDetailsData.add(OrderDetailsData(
        title: 'Pullover',
        image: AppImages.blackDress,
        company: 'mango',
        color: 'grey',
        size: 'L',
        price: 23,
        unit: 1));

    orderDetailsData.add(OrderDetailsData(
        title: 'Pullover',
        image: AppImages.blackDress2,
        company: 'mango',
        color: 'grey',
        size: 'L',
        price: 23,
        unit: 1));

    orderDetailsData.add(OrderDetailsData(
        title: 'Pullover',
        image: AppImages.streetCloths,
        company: 'mango',
        color: 'grey',
        size: 'L',
        price: 23,
        unit: 1));
    orderDetailsData.add(OrderDetailsData(
        title: 'Pullover',
        image: AppImages.men,
        company: 'mango',
        color: 'grey',
        size: 'L',
        price: 23,
        unit: 1));

    notifyListeners();
  }
}
