import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/new_product_card.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/sale_product_card.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                      height: screenHeight * 0.5,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            AppImages.banner,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 30,
                            left: 20,
                            right: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fashion\nsale',
                                  style:
                                      theme.textTheme.headlineLarge?.copyWith(
                                    fontSize: 54,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Check"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 60, vertical: 10),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )),

                  _SectionNewProduct(),

                  SizedBox(
                    height: 20,
                  ),
                  // street clothes banner starts here
                  SizedBox(
                      height: screenHeight * 0.3,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            AppImages.streetCloths,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 30,
                            left: 20,
                            right: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Street Clothes',
                                  style:
                                      theme.textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),

                  // sale card section starts here
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sale",
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "view all",
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Super summer sale",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 380,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SaleProductCard(),
                        SaleProductCard(),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // New collection part starts here
                  SizedBox(
                      height: screenHeight * 0.4,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            AppImages.banner,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 30,
                            left: 70,
                            right: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Collection',
                                  style:
                                      theme.textTheme.displayMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),

                  // bottom part of new collections section
                  SizedBox(
                    height:
                        300, // Give a fixed height so children can layout properly
                    child: Row(
                      children: [
                        // Left Side (text + image with text)
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              // Top half - Red Text
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  child: Text(
                                    'Summer\nSale',
                                    style:
                                        theme.textTheme.displayMedium?.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              // Bottom half - Image with white text
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        AppImages.blackDress2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 30,
                                      left: 30,
                                      child: Text(
                                        'Black',
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right Side (Full height image)
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  AppImages.men,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 100,
                                left: 50,
                                child: Text(
                                  'Mens\nHoodies',
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // end of bottom part of new collections section
                ],
              ),
            )
          ],
        ),
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class _SectionNewProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // new card section start here
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "view all",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "You have never seen it before",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // Sale cards shows here
        SizedBox(
          height: 380,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return NewProductCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 16,
              );
            },
          ),
        ),
      ],
    );
  }
}
