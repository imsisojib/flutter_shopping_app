import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/products_sale.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ProviderProductSale extends ChangeNotifier {
  List<ProductsSale> productSale = [];

  void fetchAllProductSale() {
    productSale.clear();
    productSale.add(ProductsSale(
      title: 'Summer Dress',
      image: AppImages.streetCloths,
      company: 'Dorothy Perkins',
      price: 45.00,
      discountPrice: 32.00,
      reviews: 6,
    ));
    productSale.add(ProductsSale(
      title: 'Winter Dress',
      image: AppImages.banner,
      company: 'Mango Boy',
      price: 20.00,
      discountPrice: 15.00,
      reviews: 3,
    ));
    productSale.add(ProductsSale(
      title: 'Long Dress',
      image: AppImages.blackDress,
      company: 'Dorothy Perkins',
      price: 90.00,
      discountPrice: 82.00,
      reviews: 5,
    ));
    productSale.add(ProductsSale(
      title: 'Men Dress',
      image: AppImages.men,
      company: 'Mango Boy',
      price: 45.00,
      discountPrice: 32.00,
      reviews: 6,
    ));
    productSale.add(ProductsSale(
      title: 'Rainy Dress',
      image: AppImages.streetCloths,
      company: 'Dorothy Perkins',
      price: 48.00,
      discountPrice: 32.00,
      reviews: 8,
    ));
    productSale.add(ProductsSale(
      title: 'Summer Dress',
      image: AppImages.blackDress2,
      company: 'Mango Boy',
      price: 45.00,
      discountPrice: 32.00,
      reviews: 2,
    ));
    productSale.add(ProductsSale(
      title: 'Winter Dress',
      image: AppImages.banner,
      company: 'Dorothy Perkins',
      price: 100.00,
      discountPrice: 80.00,
      reviews: 4,
    ));

    notifyListeners();
  }

  void toggleFavouriteIcon(String title) {
    final index = productSale.indexWhere((p) => p.title == title);
    if (index != -1) {
      productSale[index].isFavourite = !productSale[index].isFavourite;
      notifyListeners();
    }
  }

  List<ProductsSale> get productSaleFavourite =>
      productSale.where((p) => p.isFavourite == true).toList();
}
