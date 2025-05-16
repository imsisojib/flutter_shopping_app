import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/widgets/bottomsheet_product_color.dart';
import 'package:flutter_boilerplate_code/src/features/products/presentation/widgets/bottomsheet_product_size.dart';
import 'package:flutter_boilerplate_code/src/helpers/widget_helper.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';

class ScreenProductDetails extends StatelessWidget {
  const ScreenProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<String> imageList = [
      AppImages.blackDress,
      AppImages.blackDress2,
      AppImages.streetCloths,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Summer Dress",
          style: theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(bottom: 80),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with carousel part
                    SizedBox(
                      height: 250,
                      child: PageView.builder(
                        padEnds: false,
                        controller: PageController(viewportFraction: 0.55),
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: ClipRRect(
                              child: Image.asset(
                                imageList[index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // size, color and heart section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: GestureDetector(
                              onTap: () {
                                WidgetHelper.showBottomSheet(
                                  content: BottomSheetProductSize(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Size"),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 4,
                            child: GestureDetector(
                              onTap: () {
                                WidgetHelper.showBottomSheet(
                                  content: BottomSheetProductColor(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Color"),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.favorite_border,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // product info section (name, brand, price, description)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Summer Dress",
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(color: Colors.black)),
                                  SizedBox(height: 4),
                                  Text("by Sitilly",
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: Colors.grey)),
                                  SizedBox(height: 4),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.reviews);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        SizedBox(width: 6),
                                        Text(
                                          "(7)",
                                          style: theme.textTheme.titleSmall
                                              ?.copyWith(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              // Right side
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 4),
                                  Text(
                                    "\$20.90",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "This lightweight and breathable summer dress is perfect for warm days. Designed with comfort and style in mind.",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),

                // Shipping info part
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5),
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Info",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                ),

                // support part
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Support",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Colors.white,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text("Add to Cart",
                style:
                    theme.textTheme.titleSmall?.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
