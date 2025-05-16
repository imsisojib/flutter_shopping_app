import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Categories', style: theme.textTheme.titleMedium),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // categories name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Women', style: theme.textTheme.titleSmall),
                Text(
                  'Men',
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  'Kids',
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
            SizedBox(height: 16),

            // red card part

            Container(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('SUMMER SALES',
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(color: Colors.white)),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'up to 50% off ',
                      style: theme.textTheme.labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20),

            // Categories name cards
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New',
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right image part
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
