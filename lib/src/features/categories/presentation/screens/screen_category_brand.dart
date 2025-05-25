import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_brands.dart';
import 'package:provider/provider.dart';

class ScreenCategoryBrands extends StatefulWidget {
  const ScreenCategoryBrands({super.key});

  @override
  State<ScreenCategoryBrands> createState() => _ScreenCategoryBrandsState();
}

class _ScreenCategoryBrandsState extends State<ScreenCategoryBrands> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderBrands>().fetchBrands();
    });
    super.initState();
  }

  final Set<String> selectedBrands = {};
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Brand",
          style: theme.textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Consumer<ProviderBrands>(
        builder: (context, providerBrands, child) {
          final filteredBrands = providerBrands.brands.where((brand) {
            return brand.name.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: filteredBrands.length,
                  (context, index) {
                    final brand = filteredBrands[index];
                    final isSelected = selectedBrands.contains(brand.name);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          isSelected
                              ? selectedBrands.remove(brand.name)
                              : selectedBrands.add(brand.name);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              brand.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: isSelected ? Colors.red : Colors.black,
                              ),
                            ),
                            Checkbox(
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedBrands.add(brand.name);
                                  } else {
                                    selectedBrands.remove(brand.name);
                                  }
                                });
                              },
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              side: BorderSide(color: Colors.grey, width: 2),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Discard'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
