import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ProductModel {
  final String title;
  final String company;
  final String rating;
  final String price;
  final String image;

  ProductModel({
    required this.title,
    required this.company,
    required this.rating,
    required this.price,
    required this.image,
  });
}

final List<ProductModel> productList = [
  ProductModel(
    title: 'T-shirts',
    company: 'Mango',
    rating: '5',
    price: '23',
    image: AppImages.streetCloths,
  ),
  ProductModel(
    title: 'Crop tops',
    company: 'Dorothy Perkins',
    rating: '4',
    price: '20',
    image: AppImages.blackDress2,
  ),
  ProductModel(
    title: 'Sleeveless',
    company: 'LOST Ink',
    rating: '5',
    price: '43',
    image: AppImages.banner,
  ),
  ProductModel(
    title: 'Blouses',
    company: 'Topshop',
    rating: '2',
    price: '32',
    image: AppImages.blackDress2,
  ),
  ProductModel(
    title: 'Pullover',
    company: 'Topshop',
    rating: '4',
    price: '25',
    image: AppImages.blackDress,
  ),
];

class DressCard extends StatelessWidget {
  final ProductModel product;

  const DressCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int ratingValue = int.tryParse(product.rating) ?? 0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 100,
            child: ClipRRect(
              child: Image.asset(product.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: theme.textTheme.bodyLarge),
                SizedBox(height: 6),
                Text(product.company,
                    style: theme.textTheme.labelSmall
                        ?.copyWith(color: Colors.grey)),
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < ratingValue ? Icons.star : Icons.star_border,
                        size: 13,
                        color: index < ratingValue ? Colors.amber : Colors.grey,
                      );
                    }),
                    SizedBox(width: 4),
                    Text(
                      '(${product.rating})',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                Text('${product.price}\$', style: theme.textTheme.labelLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
