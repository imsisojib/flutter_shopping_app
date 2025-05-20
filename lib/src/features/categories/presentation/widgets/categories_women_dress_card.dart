import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/women_tops_card.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/rating_star.dart';

class DressCard extends StatelessWidget {
  final WomenDressCard product;

  const DressCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int ratingValue = int.tryParse(product.rating) ?? 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
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
                    RatingStar(
                        ratingValue: ratingValue, rating: product.rating),
                    Text('${product.price}\$',
                        style: theme.textTheme.labelLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -0,
          right: 25,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
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
      ],
    );
  }
}
