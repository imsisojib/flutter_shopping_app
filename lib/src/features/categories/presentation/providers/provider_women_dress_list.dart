import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/women_tops_card.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ProviderWomenDressList extends ChangeNotifier {
  List<WomenDressCard> womenTopsCard = [];

  void fetchWomenDressList() {
    womenTopsCard.clear();
    womenTopsCard.add(
      WomenDressCard(
        title: 'T-shirts',
        company: 'Mango',
        rating: '5',
        price: '23',
        image: AppImages.streetCloths,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'Crop tops',
        company: 'Dorothy Perkins',
        rating: '4',
        price: '20',
        image: AppImages.blackDress2,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'Sleeveless',
        company: 'LOST Ink',
        rating: '5',
        price: '43',
        image: AppImages.banner,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'T-shirts',
        company: 'Mango',
        rating: '5',
        price: '23',
        image: AppImages.streetCloths,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'T-shirts',
        company: 'Mango',
        rating: '5',
        price: '23',
        image: AppImages.streetCloths,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'Blouses',
        company: 'Topshop',
        rating: '2',
        price: '32',
        image: AppImages.blackDress2,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'Pullover',
        company: 'Topshop',
        rating: '4',
        price: '25',
        image: AppImages.blackDress,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'T-shirts',
        company: 'Mango',
        rating: '5',
        price: '23',
        image: AppImages.streetCloths,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'Crop tops',
        company: 'Dorothy Perkins',
        rating: '4',
        price: '20',
        image: AppImages.blackDress2,
      ),
    );

    womenTopsCard.add(
      WomenDressCard(
        title: 'Sleeveless',
        company: 'LOST Ink',
        rating: '5',
        price: '43',
        image: AppImages.banner,
      ),
    );

    notifyListeners();
  }
}
