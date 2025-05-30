import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/home/presentation/screens/screen_home.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ScreenSuccessOrder extends StatelessWidget {
  const ScreenSuccessOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.successImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 750,
            left: 130,
            child: Text('Success!', style: theme.textTheme.headlineLarge),
          ),
          Positioned(
            bottom: 690,
            left: 100,
            child: Text(
                'Your order will be delivered soon. \n Thank you for choosing our app!',
                style: theme.textTheme.titleMedium),
          ),
          Positioned(
            bottom: 620,
            left: 120,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ScreenHome()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Continue Shopping",
                  style:
                      theme.textTheme.titleSmall?.copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
