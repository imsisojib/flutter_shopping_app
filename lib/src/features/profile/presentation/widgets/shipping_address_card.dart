import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/features/profile/data/shipping_adresses_data.dart';

class ShippingAddressCard extends StatefulWidget {
  final ShippingAddressData shippingAddressData;
  const ShippingAddressCard({super.key, required this.shippingAddressData});

  @override
  State<ShippingAddressCard> createState() => _ShippingAddressCardState();
}

class _ShippingAddressCardState extends State<ShippingAddressCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.shippingAddressData.name,
                      style: theme.textTheme.bodyMedium),
                  SizedBox(height: 4),
                  Text(widget.shippingAddressData.address,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black54)),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                          side: BorderSide(
                              color: isChecked ? Colors.black : Colors.grey,
                              width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.black;
                            }
                            return Colors.transparent;
                          }),
                        ),
                      ),
                      Text(" Use as the shipping address",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black54)),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Edit",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
