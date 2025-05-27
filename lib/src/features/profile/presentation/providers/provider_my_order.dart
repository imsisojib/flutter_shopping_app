import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/my_order_data.dart';

class ProviderMyOrder extends ChangeNotifier {
  List<MyOrderPageData> myOrderPageData = [];

  void fetchMyOrderPageData() {
    myOrderPageData.clear();

    myOrderPageData.add(MyOrderPageData(
        orderNo: '1947034',
        trackingNo: 'IW3475453455',
        quantity: 3,
        totalAmount: 112,
        date: '05-12-2019',
        status: "Delivered"));

    myOrderPageData.add(MyOrderPageData(
        orderNo: '1947023',
        trackingNo: 'IW3475453455',
        quantity: 3,
        totalAmount: 112,
        date: '15-06-2020',
        status: "Delivered"));

    myOrderPageData.add(MyOrderPageData(
        orderNo: '1947067',
        trackingNo: 'IW3475453445',
        quantity: 3,
        totalAmount: 112,
        date: '25-03-2021',
        status: "Delivered"));

    myOrderPageData.add(MyOrderPageData(
        orderNo: '1947034',
        trackingNo: 'IW3475453455',
        quantity: 3,
        totalAmount: 112,
        date: '29-10-2022',
        status: "Delivered"));

    notifyListeners();
  }
}
