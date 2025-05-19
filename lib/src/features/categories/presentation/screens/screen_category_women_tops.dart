import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/women_tops_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_women_tops_list.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:provider/provider.dart';

import '../widgets/categories_women_dress_card.dart';

class ScreenCategoryWomenTops extends StatefulWidget {
  const ScreenCategoryWomenTops({super.key});

  @override
  State<ScreenCategoryWomenTops> createState() =>
      _ScreenCategoryWomenTopsState();
}

class _ScreenCategoryWomenTopsState extends State<ScreenCategoryWomenTops> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderWomenTopsList>().fetchWomenTopsList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          Consumer<ProviderWomenTopsList>(
            builder: (_, ProviderWomenTopsList, child) {
              final womenTopsList = ProviderWomenTopsList.womenTopsList;
              return SliverToBoxAdapter(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: womenTopsList.length,
                    itemBuilder: (context, index) {
                      final item = womenTopsList[index];
                      return Container(
                          width: 100,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              womenTopsList[index].title,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ));
                    },
                  ),
                ),
              ));
            },
          ),
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
