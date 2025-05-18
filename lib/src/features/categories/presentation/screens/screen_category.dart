import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/categories_card.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

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
        body: CustomScrollView(
          slivers: [
            SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Women', style: theme.textTheme.titleSmall),
                      Text(
                        'Men',
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        'Kids',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // red card part

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
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
                  CategoryCard(
                    title: 'New',
                    imagePath: AppImages.blackDress,
                  ),

                  SizedBox(height: 20),

                  CategoryCard(
                    title: 'Cloths',
                    imagePath: AppImages.streetCloths,
                  ),

                  SizedBox(height: 20),

                  CategoryCard(
                    title: 'Shoes',
                    imagePath: AppImages.men,
                  ),

                  SizedBox(height: 20),

                  CategoryCard(
                    title: 'Accesories',
                    imagePath: AppImages.banner,
                  ),

                  SizedBox(height: 20),

                  CategoryCard(
                    title: 'Accesories',
                    imagePath: AppImages.banner,
                  ),

                  SizedBox(height: 20),

                  CategoryCard(
                    title: 'Accesories',
                    imagePath: AppImages.banner,
                  ),
                ])))
          ],
        ));
  }
}
