import 'package:events/core/app_colors.dart';
import 'package:flutter/material.dart';

class EventTab extends StatelessWidget {
  final String categoryName;
  final bool isSelected;

  const EventTab({
    super.key,
    required this.categoryName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.prime : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.prime),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.prime,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
