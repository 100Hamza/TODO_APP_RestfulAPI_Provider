import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  CustomText({super.key , required this.title , this.color = Colors.white , this.fontSize = 16, this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize ,
        fontWeight: fontWeight
      ),
    );
  }
}
