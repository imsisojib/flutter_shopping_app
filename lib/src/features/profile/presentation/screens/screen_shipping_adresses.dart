import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/providers/provider_shipping_addresses.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_add_shipping_address.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/widgets/shipping_address_card.dart';
import 'package:provider/provider.dart';

class ScreenShippingAddresses extends StatefulWidget {
  const ScreenShippingAddresses({super.key});

  @override
  State<ScreenShippingAddresses> createState() =>
      _ScreenShippingAddressesState();
}

class _ScreenShippingAddressesState extends State<ScreenShippingAddresses> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderShippingAddresses>().fetchShippingAddressData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.chevron_left)),
        title: Text(
          'Shipping Addresses',
          style: theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Consumer<ProviderShippingAddresses>(
          builder: (context, providerShippingAddress, child) {
        final shippingAddressData = providerShippingAddress.shippingAddressData;
        return CustomScrollView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ShippingAddressCard(
                      shippingAddressData: shippingAddressData[index],
                    );
                  },
                  childCount: shippingAddressData.length,
                ),
              )
            ]);
      }),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(right: 16, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ScreenAddShippingAddress()));
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
