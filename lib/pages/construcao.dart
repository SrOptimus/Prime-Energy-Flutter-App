import 'package:flutter/material.dart';

class Construcao extends StatefulWidget {
  @override
  _ConstrucaoState createState() => _ConstrucaoState();
}

class _ConstrucaoState extends State<Construcao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.2,
          title: Text('Página em construção'),
        ),
        body: Center(
          child: Text('Em breve', style: TextStyle(fontSize: 18),),
        ));
  }
}
