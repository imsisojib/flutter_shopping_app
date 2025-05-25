import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/widgets/bottomsheet_password_change.dart';
import 'package:flutter_boilerplate_code/src/helpers/widget_helper.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/widgets/bottom_navigation.dart';
import '../providers/provider_profile_page.dart';

class ScreenProfileSetting extends StatefulWidget {
  const ScreenProfileSetting({super.key});

  @override
  State<ScreenProfileSetting> createState() => _ScreenProfileSettingState();
}

class _ScreenProfileSettingState extends State<ScreenProfileSetting> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      //context.read<ProviderProfilePage>().fetchProfilePage();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: theme.textTheme.headlineMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Personal Information", style: theme.textTheme.bodyLarge),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full name',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                label: RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Date of birth\n',
                        style: TextStyle(color: Colors.black, height: 1.8),
                      ),
                      TextSpan(
                        text: '12/12/1989',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Password", style: theme.textTheme.bodyLarge),
                InkWell(
                  onTap: () {
                    WidgetHelper.showBottomSheet(
                        content: BottomSheetChangePassword());
                  },
                  child: Text("Change",
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: Colors.grey)),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                label: RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Password\n',
                        style: theme.textTheme.labelSmall
                            ?.copyWith(color: Colors.grey, height: 1.8),
                      ),
                      TextSpan(
                        text: '****************',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            Text("Notifications", style: theme.textTheme.bodyLarge),
            SizedBox(height: 20),
            Text("Sales", style: theme.textTheme.bodyMedium),
            SizedBox(height: 20),
            Text("New arrivals", style: theme.textTheme.bodyMedium),
            SizedBox(height: 20),
            Text("Delivery status changes", style: theme.textTheme.bodyMedium),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
