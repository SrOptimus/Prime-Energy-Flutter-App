import 'package:flutter/material.dart';

class AparelhosDetails extends StatefulWidget {
  final imgtopico;
  final titulotopico;
  final infotopico;

//  AparelhosDetails({Key key, @required this.imgtopico}) : super(key: key);
  AparelhosDetails({this.titulotopico, this.infotopico, this.imgtopico});

  @override
  _AparelhosDetailsState createState() => _AparelhosDetailsState();
}

class _AparelhosDetailsState extends State<AparelhosDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          title: Text('Prime Energy'),
        ),
        body: Column(
//          padding: EdgeInsets.all(5),
          children: <Widget>[
            Image.asset(widget.imgtopico, width: double.infinity),
            ListTile(
              trailing: GestureDetector(
                  child: Icon(Icons.share, color: Colors.deepOrange),
                  onTap: () {
                    debugPrint('Share pressionado');
                  }),
              title: Text(widget.titulotopico,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )),
            ),
            Container(child: Text('[Informações]'))
          ],
        ));
  }
}
