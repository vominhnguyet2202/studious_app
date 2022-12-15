import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();
  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "hi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("Please login before you start")
        ],
      ),
      actions: [
        TextButton(onPressed: onTap, child: const Text("Confirm")),
      ],
    );
  }

  static Widget correctAnswerDialog(
      {required VoidCallback onTap,
      required String answer,
      required String question}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$question ",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("Answer. $answer")
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: const Text('Continue'))],
    );
  }
}
