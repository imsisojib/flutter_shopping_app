import 'package:flutter/material.dart';

class WriteReviewPage extends StatelessWidget {
  const WriteReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Rating and Reviews"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("4 Reviews", style: theme.textTheme.bodyMedium),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    Text("With photo"),
                  ],
                ),
              ],
            ),

            // Bottom Sheet-like UI
            Container(
              width: double.infinity,
              height: 600,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "What is your rate?",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Stars
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star_border,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Text prompt
                  Center(
                    child: Text(
                      "Please share your opinion \n     about the product",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input field
                  TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Write your review here...",
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Camera icon with text
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child:
                            const Icon(Icons.camera_alt, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      const Text("Add your photo"),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Send Review Button
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Submit logic here
            },
            child: const Text(
              "SEND REVIEW",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
