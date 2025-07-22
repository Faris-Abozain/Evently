import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class CustomBtn extends StatelessWidget {
  String text;
   CustomBtn({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 360,
      decoration: BoxDecoration(
          color: AppColors.prime,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
