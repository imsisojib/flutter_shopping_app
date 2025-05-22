import 'dart:ui';

class ProductsSale {
  String title;
  String image;
  String company;
  double price;
  double discountPrice;
  int reviews;
  bool isFavourite;

  ProductsSale({
    required this.title,
    required this.image,
    required this.company,
    required this.price,
    required this.discountPrice,
    required this.reviews,
    this.isFavourite = false,
  });
}
