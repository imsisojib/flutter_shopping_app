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
                    width: 100,
                    height: 120,
                    child: ClipRRect(
                      child: Image.asset(product.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title, style: theme.textTheme.bodyLarge),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: theme.textTheme.bodySmall
                                        ?.copyWith(color: Colors.grey),
                                    children: [
                                  TextSpan(text: "Color: "),
                                  TextSpan(
                                    text: "Orange",
                                    style: theme.textTheme.bodySmall
                                        ?.copyWith(color: Colors.black),
                                  )
                                ])),
                            SizedBox(width: 8),
                            RichText(
                                text: TextSpan(
                                    style: theme.textTheme.bodySmall
                                        ?.copyWith(color: Colors.grey),
                                    children: [
                                  TextSpan(text: "Size: "),
                                  TextSpan(
                                    text: "L",
                                    style: theme.textTheme.bodySmall
                                        ?.copyWith(color: Colors.black),
                                  )
                                ])),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ]),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  )),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              '0',
                              style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ]),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.grey,
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Positioned(
                            child: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(child: Text("Add to favourite")),
                            PopupMenuItem(child: Text("Delete from list")),
                          ],
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: Colors.grey,
                          ),
                        )),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '23\$',
                            style: theme.textTheme.titleSmall,
                          ),
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
      ],
    );
  }
}
