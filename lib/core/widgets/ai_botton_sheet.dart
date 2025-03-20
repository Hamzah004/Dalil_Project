
import 'package:flutter/material.dart';

class AiBottonSheet {
  static void getAIButtonSheet(BuildContext context) {
    showModalBottomSheet(
  context: context,
  isScrollControlled: true, // Optional: Allows full-height sheet
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Rounded corners
  ),
  builder: (context) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hiiiiiii',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  ),
);

  }
}