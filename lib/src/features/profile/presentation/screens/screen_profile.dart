import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 4,
      ),
    );
  }
}
