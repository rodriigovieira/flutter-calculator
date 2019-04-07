import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// This file is responsable for displaying
// the modal with more informations in the application.
// It includes the app description alognside with a link
// to the application's source-code.

class ModalSourceCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Mais Informações'),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                          'Esse é um aplicativo feito para mostrar as capacidades básicas do framework Flutter. Para acessar o código-fonte, clique no botão abaixo.'),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Código-Fonte'),
                    onPressed: () async {
                      String repoUrl =
                          'https://github.com/rodriigovieira/flutter-calculator';

                      if (await canLaunch(repoUrl)) {
                        await launch(repoUrl);
                      } else {
                        throw 'Could not launch $repoUrl.';
                      }
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(child: Text('Criado por Rodrigo Vieira.')),
                  ),
                ],
              ),
        );
      },
    );
  }
}
