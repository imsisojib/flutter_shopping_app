import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/widgets/bottom_navigation.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cart Screen"),
      ),
      bottomNavigationBar: BottomNavigation(
        activeIndex: 2,
      ),
    );
  }
}
