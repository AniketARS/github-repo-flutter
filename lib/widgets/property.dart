import 'package:flutter/material.dart';

import '../resources/constants.dart';

class PropertyWidget extends StatelessWidget {
  final String property;
  final int value;
  final double fontSize;
  const PropertyWidget({
    Key? key,
    required this.value,
    required this.property,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            color: AppColors.titleColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: fontSize / 5),
        Text(property,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.highlight,
            )),
      ],
    );
  }
}
