
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback? optionalOnPress;

  ConfirmationDialog({this.title, this.message, this.optionalOnPress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      title: Text(
        title ?? '', style: TextStyle(color: Colors.grey[900], fontSize: 16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message ?? '', style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity ,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),

                    ))),
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    optionalOnPress?.call();
                    Navigator.of(context).pop();
                  },
                  child: Text('OK', style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
