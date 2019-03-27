import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DicasPage extends StatefulWidget {
  @override
  _DicasPageState createState() => _DicasPageState();
}

class _DicasPageState extends State<DicasPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          title: Text('Dicas e Curiosidades'),
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
