import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.deepOrange,
        title: Text('Sobre'),
      ),
      body: Container(
          child: ListView(children: <Widget>[
        Divider(),
        ListTile(
          title: Text('Sobre o app:',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          subtitle: Text(
              '\n'
              'App ainda em desenvolvimento!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
        ),
        Divider(),
        ListTile(
          title: Text('Status do app',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          subtitle: Text(
              '\n'
              'Tela inicial: 40% \n'
              'Calculadora: 80% \n'
              'Dicas/Curiosidades: 0% \n'
              'Dados sobre fatura: 0% \n'
              'Quiz: 40% \n'
              'Configurações: 60% \n'
              'Compartilhar: 0% \n'
              'Sobre o app: 50%',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
        ),
        Divider(),
        ListTile(
          title: Text('Atualiações pendentes',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          subtitle: Text(
              '\n'
                  'Ícone/Nome App \n'
                  'Configurações: ao alterar kwh, atualizar os valores da Lista de Aparelhos \n',
              style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        ),
        Divider(),
        ListTile(
          title: Text('Versão',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          subtitle: Text(
              '\n'
              'Alpha 0.5',
              style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        ),
      ])),
    );
  }
}
