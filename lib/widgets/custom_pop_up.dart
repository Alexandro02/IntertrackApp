import 'package:flutter/material.dart';

class CustomPopUp extends StatelessWidget {
  final String dialogTitle;
  final String dialogText;
  final String buttonText;

  const CustomPopUp({
    Key? key,
    required this.dialogTitle,
    required this.dialogText,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      content: Text(dialogText),
      actions: <Widget>[
        TextButton(
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
