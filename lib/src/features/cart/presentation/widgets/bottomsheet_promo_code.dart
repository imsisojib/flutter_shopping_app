import 'package:flutter/material.dart';

import 'build_bottomsheet_card.dart';

class BottomSheetPromoCode extends StatelessWidget {
  const BottomSheetPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your promo code",
                    hintStyle: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 10,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(height: 4, width: 40, color: Colors.grey[400]),
                SizedBox(height: 10),
                Text("Your Promo Codes", style: theme.textTheme.titleMedium),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              buildPromoCodeCard(context, "10% off", Colors.red,
                  "Personal Offer", "mypromocode2020", "6 days remaining"),
              buildPromoCodeCard(context, "15% off", Colors.grey, "Summer Sale",
                  "summer2020", "23 days remaining"),
              buildPromoCodeCard(context, "22% off", Colors.black,
                  "Personal Offer", "personal2024", "6 days remaining"),
            ],
          ),
        ),
      ],
    );
  }
}
