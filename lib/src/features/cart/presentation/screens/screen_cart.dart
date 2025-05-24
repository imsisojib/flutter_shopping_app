import 'package:flutter/material.dart';
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
