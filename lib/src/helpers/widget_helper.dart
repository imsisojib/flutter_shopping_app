import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/di_container.dart';
import 'package:flutter_boilerplate_code/src/core/application/navigation_service.dart';

class WidgetHelper {
  static void showBottomSheet({required Widget content}) {
    showModalBottomSheet(
      context: sl<NavigationService>().navigatorKey.currentContext!,
      isScrollControlled: true, // makes it slide up more smoothly
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.25,
          maxChildSize: 0.75,
          builder: (context, scrollController) {
            return content;
          },
        );
      },
    );
  }
}
