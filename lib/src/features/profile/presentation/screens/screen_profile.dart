import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/providers/provider_profile_page.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_my_order.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_payment_method.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_profile_setting.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/screens/screen_shipping_adresses.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_page_card.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderProfilePage>().fetchProfilePage();
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
      body: Consumer<ProviderProfilePage>(
        builder: (context, providerProfilePage, child) {
          final profileData = providerProfilePage.profilePageData;
          return CustomScrollView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Text("My Profile",
                        style: theme.textTheme.headlineMedium),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(AppImages.blackDress2),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Matilda Brown",
                              style: theme.textTheme.titleLarge,
                            ),
                            Text(
                              "matildabrown@mail.com",
                              style: theme.textTheme.titleSmall
                                  ?.copyWith(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                      List.generate(profileData.length * 2, (index) {
                    if (index.isOdd) {
                      return Divider(thickness: 1, color: Colors.grey.shade300);
                    }
                    final data = profileData[index ~/ 2];
                    return profileCard(data.title, data.description, context,
                        onTap: () {
                      if (data.title == 'Settings') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ScreenProfileSetting()));
                      } else if (data.title == 'My Orders') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ScreenMyOrder()));
                      } else if (data.title == 'Shipping addresses') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ScreenShippingAddresses()));
                      } else if (data.title == 'Payment methods') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ScreenPaymentMethod()));
                      }
                    });
                  })),
                )
              ]);
        },
      ),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 4,
      ),
    );
  }
}
