import 'package:flutter/material.dart';

Widget buildRatingBar(double value) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    width: 114,
    height: 8,
    child: FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: value,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
