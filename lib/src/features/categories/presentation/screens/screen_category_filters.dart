import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/providers/provider_colors.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/screens/screen_category_brand.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/filters_colors_dot_chip.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/filters_grid_category_chip.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/filters_section_wrapper.dart';
import 'package:flutter_boilerplate_code/src/features/categories/presentation/widgets/filters_size_chip.dart';
import 'package:provider/provider.dart';

class ScreenCategoryFilters extends StatefulWidget {
  const ScreenCategoryFilters({super.key});
  @override
  State<ScreenCategoryFilters> createState() => _ScreenCategoryFiltersState();
}

class _ScreenCategoryFiltersState extends State<ScreenCategoryFilters> {
  RangeValues priceRange = RangeValues(78, 143);

  Set<String> selectedSizes = {"S"};
  Set<String> selectedCategories = {"All"};
  List<Color> selectedColors = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<ProviderColors>().fetchColor();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("Filters"),
        centerTitle: true,
      ),
      body: Consumer<ProviderColors>(builder: (context, providerColors, child) {
        final colors = providerColors.colorList;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FiltersSectionWrapper(
                    title: "Price range",
                    theme: theme,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$${priceRange.start.toInt()}",
                                    style: theme.textTheme.bodyMedium),
                                Text("\$${priceRange.end.toInt()}",
                                    style: theme.textTheme.bodyMedium),
                              ],
                            )),
                        RangeSlider(
                          values: priceRange,
                          min: 0,
                          max: 200,
                          labels: RangeLabels(
                            "\$${priceRange.start.toInt()}",
                            "\$${priceRange.end.toInt()}",
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              priceRange = values;
                            });
                          },
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                  FiltersSectionWrapper(
                      title: "Colors",
                      theme: theme,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: colors.map((color) {
                          return FiltersColorsDotChip(
                            color: color.color,
                            selected: selectedColors.contains(color.color),
                            onTap: () {
                              setState(() {
                                if (selectedColors.contains(color.color)) {
                                  selectedColors.remove(color.color);
                                } else {
                                  selectedColors.add(color.color);
                                }
                              });
                            },
                          );
                        }).toList(),
                      )),
                  FiltersSectionWrapper(
                      title: "Sizes",
                      theme: theme,
                      child: Wrap(
                        spacing: 20,
                        children: ["XS", "S", "M", "L", "XL"]
                            .map((size) => FiltersSizeChip(
                                  size: size,
                                  selected: selectedSizes.contains(size),
                                  onTap: () {
                                    setState(() {
                                      if (selectedSizes.contains(size)) {
                                        selectedSizes.remove(size);
                                      } else {
                                        selectedSizes.add(size);
                                      }
                                    });
                                  },
                                ))
                            .toList(),
                      )),
                  FiltersSectionWrapper(
                    title: "Category",
                    theme: theme,
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 2.5,
                      children: ["All", "Women", "Men", "Boys", "Girls"]
                          .map((cat) => FiltersGridCategoryChip(
                                category: cat,
                                selected: selectedCategories.contains(cat),
                                onTap: () {
                                  setState(() {
                                    if (selectedCategories.contains(cat)) {
                                      selectedCategories.remove(cat);
                                    } else {
                                      selectedCategories.add(cat);
                                    }
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  ),
                  FiltersSectionWrapper(
                      title: "Brand",
                      theme: theme,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenCategoryBrands(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Select brand"),
                              Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
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
                  side: BorderSide(color: Colors.black45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text('Discard'),
              ),
            ),
            SizedBox(width: 12),
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
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
