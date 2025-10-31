import 'package:events/core/app_colors.dart';
import 'package:flutter/material.dart';

class Customtab extends StatelessWidget {
  String categoryName;
  bool isSelected;
  Customtab({super.key, required this.categoryName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      height: 30,
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white)),
      child: Center(
          child: Text(
        categoryName,
        style: TextStyle(
            color: isSelected ? AppColors.prime : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500),
      )),
    );
  }
}
