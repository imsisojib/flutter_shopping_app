import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_women_tops_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/bottomshet_product_sort.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/categories_women_dress_card.dart';
import 'package:flutter_boilerplate_code/src/features/favourite/presentation/widgets/favourite_product_card.dart';
import 'package:flutter_boilerplate_code/src/features/home/data/products_sale.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_product_sale.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '../../../categories/presentation/screens/screen_category_filters.dart';

class ScreenFavourite extends StatefulWidget {
  const ScreenFavourite({super.key});

  @override
  State<ScreenFavourite> createState() => _ScreenFavouriteState();
}

class _ScreenFavouriteState extends State<ScreenFavourite> {
  bool isGridView = false;
  String? selectedSortOption;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderWomenTopsList>().fetchWomenTopsList();
    });
    super.initState();
  }

  void removeProductFromFavouriteList(ProductsSale product) {
    context.read<ProviderProductSale>().toggleFavouriteIcon(product.title);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
                              item.title,
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
          Consumer<ProviderProductSale>(
            builder: (_, provider, child) {
              final productList = provider.productSaleFavourite;

              return isGridView
                  ? SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return FavouriteProductCard(
                              product: productList[index],
                              onRemove: removeProductFromFavouriteList,
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
                          return FavouriteProductCard(
                            product: productList[index],
                            onRemove: removeProductFromFavouriteList,
                          );
                        },
                        childCount: productList.length,
                      ),
                    );
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 3,
      ),
    );
  }
}
