import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/pages/about.dart';
import 'package:flutter_prime_energy/pages/aparelhos.dart';
import 'package:flutter_prime_energy/pages/aparelhosdetails.dart';
import 'package:flutter_prime_energy/pages/construcao.dart';
import 'package:flutter_prime_energy/pages/settings.dart';
import 'package:flutter_prime_energy/pages/quiz.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // tamanho padding (espaçamento)
  final padmin = 5.0;
  String titulotopico = '[Título]';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text('Prime Energy'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
//            UserAccountsDrawerHeader(
//                accountName: Text('Prime Energy'),
//                accountEmail: Text('primeenergy@gmail.com'),
//                currentAccountPicture: GestureDetector(
//                  child: CircleAvatar(
//                    backgroundColor: Colors.orange,
//                    child: Icon(Icons.person, color: Colors.white, size: 40))),
//                decoration: BoxDecoration(
//                    color: Colors.deepOrange,
//                    image: DecorationImage(
//                        image: AssetImage('images/raio.png'),
//                        alignment: Alignment(1.1, 0)))),
            cabecalhoInk(),
            aparelhosInk(),
            dicasInk(),
            faturaInk(),
            quizInk(),
            Divider(),
            configInk(),
            shareInk(),
            aboutInk(),
            Divider(),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 100.0,
              child: ListTile(
                  title: Text('Texto 1',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center),
                  subtitle: Text('Texto 2',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center))),
          carousel(),
          Padding(
            padding: EdgeInsets.all(padmin * 2),
            child: Text('Texto 3',
                style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget cabecalhoInk() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(color: Colors.deepOrange),
        height: 65,
        child: Center(
          child: ListTile(
            trailing: CircleAvatar(backgroundColor: Colors.deepOrange),
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/raio.png'),
              backgroundColor: Colors.deepOrange,
              radius: 25,
//                      minRadius: 0, maxRadius: 25,
//                      child: Icon(
//                        Icons.flash_on,
//                        color: Colors.yellow,
//                        size: 30)
            ),
            title: Text(
              'Prime Energy',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text('App em desenvolvimento',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }

  Widget aparelhosInk() {
    return InkWell(
      onTap: () {
        debugPrint("Calcule seu consumo Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Aparelhos()));
      },
      child: ListTile(
        title: Text('Calcule seu consumo'),
        leading: Icon(Icons.assignment, color: Colors.deepOrange),
      ),
    );
  }

  Widget dicasInk() {
    return InkWell(
      onTap: () {
        debugPrint("Dicas e curiosidades Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Construcao()));
      },
      child: ListTile(
        title: Text('Dicas e curiosidades'),
        leading: Icon(Icons.format_quote, color: Colors.deepOrange),
      ),
    );
  }

  Widget faturaInk() {
    return InkWell(
      onTap: () {
        debugPrint("Conheça sua fatura Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Construcao()));
      },
      child: ListTile(
        title: Text('Conheça sua fatura'),
        leading: Icon(Icons.insert_drive_file, color: Colors.deepOrange),
      ),
    );
  }

  Widget quizInk() {
    return InkWell(
      onTap: () {
        debugPrint("Quiz Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Quiz1()));
      },
      child: ListTile(
        title: Text('Teste seu conhecimento!'),
        leading: Icon(Icons.line_style, color: Colors.deepOrange),
      ),
    );
  }

  Widget configInk() {
    return InkWell(
      onTap: () {
        debugPrint("Configurações Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
      },
      child: ListTile(
        title: Text('Configurações'),
        leading: Icon(Icons.settings, color: Colors.grey),
      ),
    );
  }

  Widget shareInk() {
    return InkWell(
      onTap: () {
        debugPrint("Compartilhar Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Construcao()));
      },
      child: ListTile(
        title: Text('Compartilhar'),
        leading: Icon(Icons.share, color: Colors.deepOrange),
      ),
    );
  }

  Widget aboutInk() {
    return InkWell(
      onTap: () {
        debugPrint("Sobre o app Pressionado");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => About()));
      },
      child: ListTile(
        title: Text('Sobre o app'),
        leading: Icon(Icons.help, color: Colors.blue),
      ),
    );
  }

  Widget carousel() {
    return Padding(
        padding: EdgeInsets.all(0),
        child: CarouselSlider(
            items: [
              "images/01.jpg",
              "images/02.jpg",
              "images/03.jpg",
              "images/04.jpg",
              "images/05.jpg",
              "images/06.jpg",
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(),
                      child: GestureDetector(
                        child: Image.asset(i, fit: BoxFit.fill),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (AparelhosDetails(
                                      imgtopico: i,
                                      titulotopico: titulotopico))));
                        },
                      ));
                },
              );
            }).toList(),
            height: 185,
            autoPlay: true));
  }
}
