import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/shipping_adresses_data.dart';

class ProviderShippingAddresses extends ChangeNotifier {
  List<ShippingAddressData> shippingAddressData = [];

  void fetchShippingAddressData() {
    shippingAddressData.clear();

    shippingAddressData.add(ShippingAddressData(
        name: "John Doe",
        address: '3 Newbridge Court Chino Hills, CA 91709, United States'));

    shippingAddressData.add(ShippingAddressData(
        name: "John Doe",
        address: '3 Newbridge Court Chino Hills, CA 91709, United States'));

    shippingAddressData.add(ShippingAddressData(
        name: "John Doe",
        address: '3 Newbridge Court Chino Hills, CA 91709, United States'));

    shippingAddressData.add(ShippingAddressData(
        name: "John Doe",
        address: '3 Newbridge Court Chino Hills, CA 91709, United States'));

    notifyListeners();
  }
}
