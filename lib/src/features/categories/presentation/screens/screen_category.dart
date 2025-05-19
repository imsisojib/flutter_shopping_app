import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/category.dart';
import 'package:flutter_boilerplate_code/src/features/categories/data/category_list.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_categories.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/categories_card.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:provider/provider.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderCategories>().fetchCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Categories', style: theme.textTheme.titleMedium),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Consumer<ProviderCategories>(
        builder: (_, providerCategories, child) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: Text(categories[index],
                            style: theme.textTheme.titleSmall),
                      );
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // red card part

                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('SUMMER SALES',
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(color: Colors.white)),
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: Text(
                                'up to 50% off ',
                                style: theme.textTheme.labelMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // Categories name cards
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          Category category =
                              providerCategories.categories[index];

                          return CategoryCard(
                            title: category.title,
                            imagePath: category.imagePath,
                          );
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(height: 20);
                        },
                        itemCount: providerCategories.categories.length,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 1,
      ),
    );
  }
}
