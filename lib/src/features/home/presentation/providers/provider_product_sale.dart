import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/products_sale.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderProductSale extends ChangeNotifier {
  List<ProductsSale> productSale = [];

  void fetchAllProductSale() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> favouriteList = preferences.getStringList('favourites') ?? [];
    List<String> bagList = preferences.getStringList('bags') ?? [];

    productSale.clear();
    productSale.add(ProductsSale(
      title: 'Summer Dress',
      image: AppImages.streetCloths,
      company: 'Dorothy Perkins',
      rating: '5',
      price: 45.00,
      discountPrice: 32.00,
      reviews: 6,
      isFavourite: favouriteList.contains('Summer Dress'),
      isInBag: bagList.contains('Summer Dress'),
    ));
    productSale.add(ProductsSale(
      title: 'Winter Dresses',
      image: AppImages.banner,
      company: 'Mango Boy',
      rating: '4',
      price: 20.00,
      discountPrice: 15.00,
      reviews: 3,
      isFavourite: favouriteList.contains('Winter Dresses'),
      isInBag: bagList.contains('Winter Dresses'),
    ));
    productSale.add(ProductsSale(
      title: 'Long Dress',
      image: AppImages.blackDress,
      company: 'Dorothy Perkins',
      rating: '2',
      price: 90.00,
      discountPrice: 82.00,
      reviews: 5,
      isFavourite: favouriteList.contains('Long Dress'),
      isInBag: bagList.contains('Long Dress'),
    ));
    productSale.add(ProductsSale(
      title: 'Men Dress',
      image: AppImages.men,
      company: 'Mango Boy',
      rating: '3',
      price: 45.00,
      discountPrice: 32.00,
      reviews: 6,
      isFavourite: favouriteList.contains('Men Dress'),
      isInBag: bagList.contains('Men Dress'),
    ));
    productSale.add(ProductsSale(
      title: 'Rainy Dress',
      image: AppImages.streetCloths,
      company: 'Dorothy Perkins',
      rating: '5',
      price: 48.00,
      discountPrice: 32.00,
      reviews: 8,
      isFavourite: favouriteList.contains('Rainy Dress'),
      isInBag: bagList.contains('Rainy Dress'),
    ));
    productSale.add(ProductsSale(
      title: 'Summer Dress2',
      image: AppImages.blackDress2,
      company: 'Mango Boy',
      rating: '1',
      price: 45.00,
      discountPrice: 32.00,
      reviews: 2,
      isFavourite: favouriteList.contains('Summer Dress2'),
      isInBag: bagList.contains('Summer Dress2'),
    ));
    productSale.add(ProductsSale(
      title: 'Winter Dress2',
      image: AppImages.banner,
      company: 'Dorothy Perkins',
      rating: '3',
      price: 100.00,
      discountPrice: 80.00,
      reviews: 4,
      isFavourite: favouriteList.contains('Winter Dress2'),
      isInBag: bagList.contains('Winter Dress2'),
    ));

    notifyListeners();
  }

  void toggleFavouriteIcon(String title) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> favList = preferences.getStringList('favourites') ?? [];

    final index = productSale.indexWhere((p) => p.title == title);
    if (index != -1) {
      productSale[index].isFavourite = !productSale[index].isFavourite;

      if (productSale[index].isFavourite) {
        favList.add(title);
      } else {
        favList.remove(title);
      }

      await preferences.setStringList('favourites', favList);

      notifyListeners();
    }
  }

  List<ProductsSale> get productSaleFavourite =>
      productSale.where((p) => p.isFavourite == true).toList();

  void toggleBagIcon(String title) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> bagList = preferences.getStringList('bags') ?? [];

    final index = productSale.indexWhere((p) => p.title == title);
    if (index != -1) {
      productSale[index].isInBag = !productSale[index].isInBag;
      if (productSale[index].isInBag) {
        bagList.add(title);
      } else {
        bagList.remove(title);
      }
      await preferences.setStringList('bags', bagList);
      notifyListeners();
    }
  }

  List<ProductsSale> get productSaleIsInBag =>
      productSale.where((p) => p.isInBag == true).toList();
}
