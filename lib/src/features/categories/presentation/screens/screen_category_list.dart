import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCategoryList extends StatelessWidget {
  const ScreenCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Categories'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Text('data'),
    );
  }
}
