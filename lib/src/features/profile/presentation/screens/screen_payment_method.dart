import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/widgets/bottomsheet_payment_method_add_new_card.dart';
import 'package:flutter_boilerplate_code/src/features/profile/presentation/widgets/use_card_checkbox_part.dart';
import 'package:flutter_boilerplate_code/src/helpers/widget_helper.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';

class ScreenPaymentMethod extends StatefulWidget {
  const ScreenPaymentMethod({super.key});

  @override
  State<ScreenPaymentMethod> createState() => _ScreenPaymentMethodState();
}

class _ScreenPaymentMethodState extends State<ScreenPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.chevron_left)),
        title: Text(
          'Payment Methods',
          style: theme.textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Your payment cards',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.card,
                fit: BoxFit.cover,
                width: 100,
                height: 200,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: UseCardCheckboxPart(),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.card2,
                fit: BoxFit.cover,
                width: 100,
                height: 200,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: UseCardCheckboxPart(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(right: 16, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                WidgetHelper.showBottomSheet(
                    content: BottomSheetPaymentMethodAddNewCard());
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
