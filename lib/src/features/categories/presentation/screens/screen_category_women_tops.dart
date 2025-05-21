import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/women_tops_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_women_dress_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_women_tops_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_filters.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/bottomshet_product_sort.dart';
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
  bool isGridView = false;
  String? selectedSortOption;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderWomenTopsList>().fetchWomenTopsList();
      context.read<ProviderWomenDressList>().fetchWomenDressList();
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ScreenCategoryFilters()),
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.filter),
                          const SizedBox(width: 6),
                          Text(
                            'Filters',
                            style: theme.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final selectedSort = await showModalBottomSheet<String>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) => const BottomSheetProductSort(),
                      );

                      if (selectedSort != null) {
                        setState(() {
                          selectedSortOption = selectedSort;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.sort),
                        const SizedBox(width: 6),
                        Text(
                          selectedSortOption ?? 'Sort',
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isGridView = !isGridView;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(isGridView
                            ? Icons.view_list_rounded
                            : Icons.grid_view_sharp),
                        SizedBox(width: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<ProviderWomenDressList>(
            builder: (_, ProviderWomenDressList, child) {
              final productList = ProviderWomenDressList.womenTopsCard;

              return isGridView
                  ? SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return DressCard(
                              product: productList[index],
                              isGrid: true,
                            );
                          },
                          childCount: productList.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return DressCard(product: productList[index]);
                        },
                        childCount: productList.length,
                      ),
                    );
            },
          ),
        ],
      )),
    );
  }
}
