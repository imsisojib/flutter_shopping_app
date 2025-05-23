import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/products_sale.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_product_sale.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:provider/provider.dart';

import '../../../categories/presentation/widgets/rating_star.dart';

class SaleProductCard extends StatelessWidget {
  final ProductsSale product;
  final int index;
  const SaleProductCard(
      {super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int ratingValue = int.tryParse(product.rating) ?? 0;
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  product.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "-20%",
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -7,
                right: 8,
                child: Consumer<ProviderProductSale>(
                    builder: (context, provider, child) {
                  final product = provider.productSale[index];

                  return InkWell(
                    onTap: () {
                      provider.toggleFavouriteIcon(product.title);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        product.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 20,
                        color:
                            product.isFavourite ? Colors.red : Colors.black87,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingStar(ratingValue: ratingValue, rating: product.rating),
                SizedBox(height: 4),
                Text(
                  product.company,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.black54),
                ),
                SizedBox(height: 4),
                Text(
                  product.title,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.black),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text("\$${product.price.toStringAsFixed(2)}",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        )),
                    SizedBox(width: 8),
                    Text(
                      "\$${product.discountPrice.toStringAsFixed(2)}",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
