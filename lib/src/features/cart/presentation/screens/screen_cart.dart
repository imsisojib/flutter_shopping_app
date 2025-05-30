import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/cart/presentation/screens/screen_checkout.dart';
import 'package:flutter_boilerplate_code/src/features/cart/presentation/widgets/bag_product_card.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/providers/provider_product_sale.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({super.key});

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderProductSale>().productSaleIsInBag;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.search)],
      ),
      body: Consumer<ProviderProductSale>(builder: (_, provider, child) {
        final bagProducts = provider.productSaleIsInBag;

        if (bagProducts.isEmpty) {
          return Center(child: Text("No Product In your Cart"));
        }

        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text("My Bag", style: theme.textTheme.headlineMedium),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BagProductCard(
                    product: bagProducts[index],
                    //onRemove: removeProductFromFavouriteList,
                  );
                },
                childCount: bagProducts.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                child: TextField(
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
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount: ",
                          style: theme.textTheme.titleSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                        Text("549\$", style: theme.textTheme.titleSmall)
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ScreenCheckout()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 140, vertical: 15),
                        ),
                        child: Text(
                          "Checkout",
                          style: theme.textTheme.titleSmall
                              ?.copyWith(color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        );
      }),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 2,
      ),
    );
  }
}
