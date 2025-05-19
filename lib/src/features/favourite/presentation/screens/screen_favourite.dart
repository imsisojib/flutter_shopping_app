import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';

class ScreenFavourite extends StatelessWidget {
  const ScreenFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favourite Screen"),
      ),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 3,
      ),
    );
  }
}
