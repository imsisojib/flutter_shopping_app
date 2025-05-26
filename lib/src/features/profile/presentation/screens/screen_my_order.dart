import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/providers/provider_my_order.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/widgets/my_order_card.dart';
import 'package:provider/provider.dart';

class ScreenMyOrder extends StatefulWidget {
  const ScreenMyOrder({super.key});

  @override
  State<ScreenMyOrder> createState() => _ScreenMyOrderState();
}

class _ScreenMyOrderState extends State<ScreenMyOrder> {
  int selected = 0;
  List<String> topBarList = ['Delivered', 'Processing', 'Cancelled'];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderMyOrder>().fetchMyOrderPageData();
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
        actions: [Icon(Icons.search)],
      ),
      body: Consumer<ProviderMyOrder>(builder: (context, provider, child) {
        final orderData = provider.myOrderPageData;
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Text(
                      "My Orders",
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: topBarList.length,
                  itemBuilder: (context, index) {
                    final item = topBarList[index];
                    final isSelected = index == selected;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        width: 110,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.black87 : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            item,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  orderData.length,
                  (index) {
                    return MyOrderCard(
                      myOrderPageData: orderData[index],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
