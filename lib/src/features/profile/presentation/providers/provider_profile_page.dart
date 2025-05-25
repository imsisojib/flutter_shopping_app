import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/profile_page_data.dart';

class ProviderProfilePage extends ChangeNotifier {
  List<ProfilePageData> profilePageData = [];

  void fetchProfilePage() {
    profilePageData.clear();
    profilePageData.add(
      ProfilePageData(
          title: 'My Orders', description: 'Already have 12 orders'),
    );
    profilePageData.add(
      ProfilePageData(title: 'Shipping addresses', description: '3 addresses'),
    );
    profilePageData.add(
      ProfilePageData(title: 'Payment methods', description: 'Visa  **34'),
    );
    profilePageData.add(
      ProfilePageData(
          title: 'Promocodes', description: 'You have special promocodes'),
    );
    profilePageData.add(
      ProfilePageData(title: 'My reviews', description: 'Reviews for 4 items'),
    );
    profilePageData.add(
      ProfilePageData(
          title: 'Settings', description: 'Notifications, password'),
    );

    notifyListeners();
  }
}
