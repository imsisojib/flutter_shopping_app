import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

import '../widgets/categories_women_dress_card.dart';

class ScreenCategoryWomenTops extends StatelessWidget {
  const ScreenCategoryWomenTops({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> items = [
      'T-shirts',
      'Crop tops',
      'Sleeveless',
      'Blouses',
      'Shirt',
      'Pullover',
      'T-shirts',
      'Crop tops',
      'Sleeveless',
      'Blouses',
      'Shirt',
      'Pullover'
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Women's Top's"),
        centerTitle: true,
        actions: [Icon(Icons.search)],
      ),
      body: SafeArea(
          child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          '$item',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ));
                },
              ),
            ),
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.filter),
                        SizedBox(width: 6),
                        Text(
                          'Filters',
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.low_priority),
                      SizedBox(width: 6),
                      Text(
                        'Price lowest to high',
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.filter),
                      SizedBox(height: 6),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DressCard(product: productList[index]);
              },
              childCount: productList.length,
            ),
          ),
        ],
      )),
    );
  }
}
