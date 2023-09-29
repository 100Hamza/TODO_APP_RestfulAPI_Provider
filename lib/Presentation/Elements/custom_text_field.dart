import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEditTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  int maxLines ;
  String hintText;
  CustomEditTextField({super.key , required this.controller , this.maxLines = 1 ,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)),
          hintText: hintText,

      ),
    );
  }
}
