
import 'package:flutter/material.dart';

class Customtab extends StatelessWidget {
  String categoryName;
   Customtab({super.key,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 75,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius:BorderRadius.circular(16),
          border:Border.all(color: Colors.white)
      ),
      child: Center(child: Text(categoryName,style: TextStyle(color: Colors.white),)),
    );
  }
}
