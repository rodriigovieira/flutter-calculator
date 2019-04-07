import 'package:flutter/material.dart';

// This file is responsable for creating
// all the buttons of the calculator.

class BuildButton extends StatelessWidget {
  final Function handleOperation;
  final Brightness appBrightness;
  final String buttonText;

  BuildButton(this.handleOperation, this.appBrightness, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        // borderSide: BorderSide(color: Colors.blue),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: appBrightness == Brightness.dark
                ? Colors.yellow[700]
                : Colors.black,
          ),
        ),
        onPressed: () => handleOperation(context, buttonText),
      ),
    );
  }
}
