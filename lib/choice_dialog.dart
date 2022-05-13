
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChoiceDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? firstButtonText;
  final VoidCallback? firstButtonOnPress;
  final String? secondButtonText;
  final VoidCallback? secondButtonOnPress;

  ChoiceDialog({this.title,
    this.message,
    this.firstButtonText,
    required this.firstButtonOnPress,
    this.secondButtonText,
    required this.secondButtonOnPress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: Text(
        title ?? '',
        style: TextStyle(color: Colors.grey[900], fontSize: 16),
      ),
      content: Text(
        message ?? '',
        style: TextStyle(color: Colors.grey[500], fontSize: 12),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepOrangeAccent),
              borderRadius: BorderRadius.circular(20),

            )
          ),),
            onPressed: () {
              firstButtonOnPress!();
              Navigator.of(context).pop();
            },
            child: Text(firstButtonText!, style: TextStyle(color: Colors.deepOrangeAccent))),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
              ),),
            onPressed: () {
              secondButtonOnPress!();
              Navigator.of(context).pop();
            },
            child: Text(secondButtonText!, style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
