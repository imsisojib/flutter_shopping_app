import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/my_order_data.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_order_details.dart';

class MyOrderCard extends StatelessWidget {
  final MyOrderPageData myOrderPageData;

  const MyOrderCard({super.key, required this.myOrderPageData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quantity = myOrderPageData.quantity;
    final price = myOrderPageData.totalAmount;
    final trackingNo = myOrderPageData.trackingNo;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(15.0),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order No: ${myOrderPageData.orderNo}',
                  style: theme.textTheme.titleMedium),
              Text(myOrderPageData.date,
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Tracking number: ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: trackingNo,
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Quantity:  ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: '$quantity',
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Total Amount: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: '\$$price',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenOrderDetails(
                                orderNo: myOrderPageData.orderNo,
                                trackingNo: myOrderPageData.trackingNo,
                                date: myOrderPageData.date,
                                status: myOrderPageData.status,
                              )));
                },
                style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: Text(
                    'Details',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  myOrderPageData.status,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.green),
                ),
              ),
            ],
          ),
        ]));
  }
}
