import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/order_details_data.dart';

class OrderDetailsCard extends StatelessWidget {
  final OrderDetailsData orderDetailsData;

  const OrderDetailsCard({super.key, required this.orderDetailsData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = orderDetailsData.color,
        size = orderDetailsData.size,
        price = orderDetailsData.price,
        unit = orderDetailsData.unit;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //padding: EdgeInsets.symmetric(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 120,
                height: 130,
                child: ClipRect(
                  child: Image.asset(
                    orderDetailsData.image,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(orderDetailsData.title,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 4),
                  Text(orderDetailsData.company,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Color:  ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: color,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Size:  ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: size,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Unit:  ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: (unit.toString()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('\$$price', style: theme.textTheme.titleMedium)
              ],
            ),
            SizedBox(height: 12)
          ],
        ));
  }
}
