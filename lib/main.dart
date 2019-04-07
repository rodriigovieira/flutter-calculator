import 'package:flutter/material.dart';

import './more_info_modal.dart';
import './build_button.dart';
import './render_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _displayText = '0';
  String operand = '';

  // Assigning dynamic value to brightness.
  Brightness appBrightness = Brightness.light;

  handleOperation(BuildContext context, String buttonText) {
    renderText(context, buttonText, displayResult);
  }

  displayResult(String text, String operandSignal) {
    setState(() {
      _displayText = text;
      operand = operandSignal;
    });
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: appBrightness,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Menu'),
              ),
              ListTile(
                title: Text(appBrightness == Brightness.light
                    ? 'Ativar Modo Escuro'
                    : 'Desativar Modo Escuro'),
                onTap: () {
                  setState(() {
                    if (appBrightness == Brightness.dark) {
                      appBrightness = Brightness.light;
                    } else {
                      appBrightness = Brightness.dark;
                    }
                  });
                },
              ),
              ModalSourceCode(),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                child: Text(
                  _displayText,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Text(
                  operand.length > 0 ? operand : '',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 40.0,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        BuildButton(handleOperation, appBrightness, '7'),
                        BuildButton(handleOperation, appBrightness, '8'),
                        BuildButton(handleOperation, appBrightness, '9'),
                        BuildButton(handleOperation, appBrightness, 'X')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        BuildButton(handleOperation, appBrightness, '4'),
                        BuildButton(handleOperation, appBrightness, '5'),
                        BuildButton(handleOperation, appBrightness, '6'),
                        BuildButton(handleOperation, appBrightness, '/')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        BuildButton(handleOperation, appBrightness, '1'),
                        BuildButton(handleOperation, appBrightness, '2'),
                        BuildButton(handleOperation, appBrightness, '3'),
                        BuildButton(handleOperation, appBrightness, '-')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        BuildButton(handleOperation, appBrightness, '.'),
                        BuildButton(handleOperation, appBrightness, '0'),
                        BuildButton(handleOperation, appBrightness, '00'),
                        BuildButton(handleOperation, appBrightness, '+')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        BuildButton(
                            handleOperation, appBrightness, 'LIMPAR'),
                        BuildButton(handleOperation, appBrightness, '=')
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
