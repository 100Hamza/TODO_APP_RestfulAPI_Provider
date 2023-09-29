import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/Presentation/Elements/custom_text.dart';

Future showDialogAlert({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onYesPress,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: CustomText(
          title: content,
        ),
        actions: [
          TextButton(
              onPressed: onYesPress,
              child: CustomText(
                title: 'Yes',
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomText(
                title: 'No',
              ))
        ],
      );
    },
  );
}
