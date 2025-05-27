import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/providers/provider_order_details.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/widgets/order_details_card.dart';
import 'package:provider/provider.dart';

import '../widgets/other_info_widget.dart';

class ScreenOrderDetails extends StatefulWidget {
  final String? orderNo, trackingNo, date, status;

  const ScreenOrderDetails(
      {super.key, this.orderNo, this.trackingNo, this.date, this.status});

  @override
  State<ScreenOrderDetails> createState() => _ScreenOrderDetailsState();
}

class _ScreenOrderDetailsState extends State<ScreenOrderDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderOrderDetails>().fetchOrderDetailsData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.chevron_left)),
          title: Text(
            "Order Details",
            style: theme.textTheme.titleMedium,
          ),
          centerTitle: true,
          actions: [Icon(Icons.search)],
        ),
        body:
            Consumer<ProviderOrderDetails>(builder: (context, provider, child) {
          final orderData = provider.orderDetailsData;
          final count = orderData.length;
          return CustomScrollView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Order No: ${widget.orderNo}',
                                style: theme.textTheme.titleMedium),
                            Text('${widget.date}',
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Tracking number: ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: widget.trackingNo,
                                  ),
                                ],
                              ),
                            ),
                            Text('${widget.status}',
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: Colors.green)),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text('$count items'),
                        SizedBox(height: 12),
                      ]),
                )),
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      count,
                      (index) {
                        return OrderDetailsCard(
                          orderDetailsData: orderData[index],
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Order information",
                                style: theme.textTheme.bodyMedium)
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            otherInfoWidget(
                                'Shipping Address:',
                                '3 Newbridge Court, Chino Hills, CA 91709, United States',
                                theme),
                            otherInfoWidget('Payment method:',
                                '**** **** **** 3947', theme),
                            otherInfoWidget('Delivery method:',
                                'FedEx, 3 days, 15\$', theme),
                            otherInfoWidget(
                                'Discount:', '10%, Personal promo code', theme),
                            otherInfoWidget('Total Amount:', '100\$', theme),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 2),
                                child: Text(
                                  'Reorder',
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  side: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  backgroundColor: Colors.red),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 2),
                                child: Text(
                                  'Leave feedback',
                                  style: theme.textTheme.titleMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ]);
        }));
  }
}
