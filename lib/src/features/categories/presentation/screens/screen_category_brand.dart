import 'package:flutter/material.dart';

class ScreenCategoryBrands extends StatefulWidget {
  const ScreenCategoryBrands({super.key});

  @override
  State<ScreenCategoryBrands> createState() => _ScreenCategoryBrandsState();
}

class _ScreenCategoryBrandsState extends State<ScreenCategoryBrands> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      //context.read<ProviderWomenTopsList>().fetchWomenTopsList();
      // context.read<ProviderWomenDressList>().fetchWomenDressList();
    });
    super.initState();
  }

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
        ),
        centerTitle: true,
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
                  Navigator.of(context).pop(); // or reset filters
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
                onPressed: () {
                  // apply filter logic
                },
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
