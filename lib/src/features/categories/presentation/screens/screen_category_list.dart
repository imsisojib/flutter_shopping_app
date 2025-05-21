import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_all_category_list.dart';
import 'package:provider/provider.dart';

import '../widgets/categories_name.dart';

class ScreenCategoryList extends StatefulWidget {
  const ScreenCategoryList({super.key});

  @override
  State<ScreenCategoryList> createState() => _ScreenCategoryListState();
}

class _ScreenCategoryListState extends State<ScreenCategoryList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderAllCategoryList>().fetchAllCategories();
    });
    super.initState();
  }

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
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "View All Items",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  'Choose Category',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 15),
              Container(height: 2, color: Colors.grey[300]),
            ]),
          ),
          Consumer<ProviderAllCategoryList>(
            builder: (context, ProviderAllCategoryList, _) {
              final categoryList = ProviderAllCategoryList.allCategories;

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final category = categoryList[index];
                    return CategoryName(title: category.title);
                  },
                  childCount: categoryList.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
