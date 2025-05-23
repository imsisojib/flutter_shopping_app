import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/rating_star.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/products_sale.dart';

class FavouriteProductCard extends StatelessWidget {
  final ProductsSale product;
  final bool isGrid;
  final void Function(ProductsSale product)? onRemove;

  const FavouriteProductCard(
      {super.key, required this.product, this.isGrid = false, this.onRemove});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int ratingValue = int.tryParse(product.rating) ?? 0;

    if (!isGrid) {
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
                          RatingStar(
                              ratingValue: ratingValue, rating: product.rating),
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
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 30,
            child: InkWell(
                onTap: () {
                  onRemove?.call(product);
                },
                child: Icon(
                  Icons.close,
                  size: 20,
                )),
          )
        ],
      );
    }

    // return grid layout design
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: InkWell(
                      onTap: () {
                        onRemove?.call(product);
                      },
                      child: Icon(
                        Icons.close,
                        size: 20,
                      )),
                ),
                Positioned(
                  bottom: -8,
                  right: -5,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          RatingStar(ratingValue: ratingValue, rating: product.rating),
          Text(product.company,
              style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey)),
          Text(product.title,
              style: theme.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text('${product.price}\$', style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}
