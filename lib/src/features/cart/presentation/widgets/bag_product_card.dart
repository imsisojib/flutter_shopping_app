import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/products_sale.dart';
import 'package:provider/provider.dart';

import '../../../categories/presentation/widgets/rating_star.dart';
import '../../../home/presentation/providers/provider_product_sale.dart';

class BagProductCard extends StatelessWidget {
  final ProductsSale product;
  const BagProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 110,
                    child: ClipRRect(
                      child: Image.asset(product.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.company,
                            style: theme.textTheme.labelSmall
                                ?.copyWith(color: Colors.grey)),
                        Text(product.title, style: theme.textTheme.bodyLarge),
                        Text(
                          'Color: Orange',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey),
                        ),
                        //SizedBox(height: 6),

                        //RatingStar(ratingValue: ratingValue, rating: product.rating),
                        Text('${product.price}\$',
                            style: theme.textTheme.labelLarge),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //SizedBox(height: 12),
                        Text(
                          'Size: L',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey),
                        ),
                        //RatingStar(ratingValue: ratingValue, rating: product.rating),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -3,
          right: 25,
          child: InkWell(
            onTap: () {
              Provider.of<ProviderProductSale>(context, listen: false)
                  .toggleBagIcon(product.title);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2)),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 30,
          child: InkWell(
              onTap: () {
                //onRemove?.call(product);
              },
              child: Icon(
                Icons.close,
                size: 20,
              )),
        )
      ],
    );
  }
}
