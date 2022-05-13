import 'package:flutter/material.dart';

class MultipleChoiceDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final Map<String, VoidCallback> buttons;

  MultipleChoiceDialog(
      {required this.buttons, this.title, this.message});

  List<Widget> getButtons(BuildContext context) {
    List<Widget> buttonsList = [];
    buttons.forEach((buttonTitle, callBack, ) {
      bool isLast = false;
      if (buttonsList.length == buttons.length-1) {
        isLast = true;
      }

      Widget button = Padding(
        padding: EdgeInsets.all(4),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: isLast ? MaterialStateProperty.all(Colors.deepOrangeAccent) : MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(color: Colors.deepOrangeAccent),
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            onPressed: () {
              callBack();
              Navigator.of(context).pop();
            },
            child: Text(buttonTitle, style: TextStyle(color: isLast ? Colors.white : Colors.deepOrangeAccent ),)),
      );
      buttonsList.add(button);
    });

    return buttonsList;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title ?? '',
      ),
      content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message ?? '',
          style: TextStyle(color: Colors.grey[500], fontSize: 12),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          child: Wrap(
            children: getButtons(context)
          ),
        )
      ],
    ),
    );
  }
}
