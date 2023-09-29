import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onTap;
  String buttonTitle;
  double width , borderRadius;
  bool isTrue;

  CustomButton({super.key , required this.onTap , required this.buttonTitle , this.width = 0.28, this.borderRadius = 20 , this.isTrue = false});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height * 0.053,
          width: MediaQuery.sizeOf(context).width * width,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: isTrue? SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
              width: MediaQuery.sizeOf(context).width * 0.075,
              child: const CircularProgressIndicator(color: Colors.black,)) : CustomText(title: buttonTitle , color: Colors.black,)),
    );
  }
}
