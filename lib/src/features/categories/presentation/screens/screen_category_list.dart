import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_name.dart';

class ScreenCategoryList extends StatelessWidget {
  const ScreenCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Categories'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "View All Items",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  'Choose Category',
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              CategoryName(title: 'Tops'),
              CategoryName(title: 'Shirts & Blouses'),
              CategoryName(title: 'Cardigans & Sweaters'),
              CategoryName(title: 'Knitwear'),
              CategoryName(title: 'Blazers'),
              CategoryName(title: 'Outerwear'),
              CategoryName(title: 'Pants'),
              CategoryName(title: 'Jeans'),
              CategoryName(title: 'Shorts'),
              CategoryName(title: 'Skirts'),
              CategoryName(title: 'Dresses'),
            ]),
          )
        ],
      ),
    );
  }
}
