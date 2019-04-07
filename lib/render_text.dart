import 'package:flutter/material.dart';

// All the calculator logic is placed in this file.
// It will, at the end of the function, execute the
// displayResult function, which was passed from the parent class,
// and will trigget a setState call, changing the value in the screen.

// Initializing variables for calculator.
String displayText = '0';
String operand = '';

num num1 = 0.0;
num num2 = 0.0;

bool finished = false;

renderText(BuildContext context, String buttonText, Function displayResult) {
  print(buttonText);

    if (buttonText == 'LIMPAR') {
      displayText = '0';
      operand = '';

      num1 = 0.00;
      num2 = 0.00;

      finished = false;
    } else if (displayText.length > 15) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Center(
              child: Text('Não é possível exibir mais que 15 caracteres.'),
            ),
      );

      return null;
    } else if (buttonText == '.' && displayText.contains('.')) {
      return null;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == 'X') {
      if (displayText == '0') return null;
      finished = false;

      num1 = double.parse(displayText);
      print(num1);

      operand = buttonText;
      print(true);

      displayText = '0';
    } else if (finished) {
      return null;
    } else if (buttonText == '=') {
      if (num1 == 0.00) return null;

      finished = true;

      num2 = double.parse(displayText);

      if (operand == '+') {
        displayText = (num1 + num2).toStringAsFixed(0);
      }
      if (operand == '-') {
        displayText = (num1 - num2).toStringAsFixed(0);
      }
      if (operand == '/') {
        displayText = (num1 / num2).toStringAsFixed(0);
      }
      if (operand == 'X') {
        displayText = (num1 * num2).toStringAsFixed(0);
      }

      operand = '';
    } else {
      displayText += buttonText;
    }

    displayResult(double.parse(displayText).toStringAsFixed(0), operand);
  }
