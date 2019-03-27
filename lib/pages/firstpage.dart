import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/pages/about.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_prime_energy/pages/aparelhos.dart';
import 'package:flutter_prime_energy/pages/construcao.dart';
import 'package:flutter_prime_energy/pages/dicas.dart';
import 'package:flutter_prime_energy/pages/settings.dart';
import 'package:flutter_prime_energy/pages/quiz.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // tamanho padding (espaçamento)
  final paddingminimo = 5.0;

  @override
  Widget build(BuildContext context) {
    // widget swiper (carousel)
    Widget swiperimgs = Container(
        height: 250.0,
        width: 250.0,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset('images/01.jpg',
                  fit: BoxFit.cover);
            },
            itemCount: 5,
            itemWidth: 300,
            autoplay: true,
            pagination: SwiperPagination(),
            control: SwiperControl()));
//  widget carousel
    Widget imagecarousel = Container(
        height: 250.0,
        width: 250.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/01.jpg'),
            AssetImage('images/02.jpg'),
            AssetImage('images/03.jpg'),
            AssetImage('images/04.jpg'),
            AssetImage('images/05.jpg'),
            AssetImage('images/06.jpg'),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 2),
          dotSize: 5.0,
          dotColor: Colors.white,
          dotBgColor: Colors.black54,
          indicatorBgPadding: 4.0,
          //testar
          autoplayDuration: Duration(seconds: 5),
        ));

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
            InkWell(
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
            ),
            InkWell(
              onTap: () {
                debugPrint("Calcule seu consumo Pressionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aparelhos()));
              },
              child: ListTile(
                title: Text('Calcule seu consumo'),
                leading: Icon(Icons.assignment, color: Colors.deepOrange),
              ),
            ),
            InkWell(
              onTap: () {
                debugPrint("Dicas e curiosidades Pressionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DicasPage()));
              },
              child: ListTile(
                title: Text('Dicas e curiosidades'),
                leading: Icon(Icons.format_quote, color: Colors.deepOrange),
              ),
            ),
            InkWell(
              onTap: () {
                debugPrint("Conheça sua fatura Pressionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Construcao()));
              },
              child: ListTile(
                title: Text('Conheça sua fatura'),
                leading:
                    Icon(Icons.insert_drive_file, color: Colors.deepOrange),
              ),
            ),
            InkWell(
              onTap: () {
                debugPrint("Quiz Pressionado");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz1()));
              },
              child: ListTile(
                title: Text('Teste seu conhecimento!'),
                leading: Icon(Icons.line_style, color: Colors.deepOrange),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                debugPrint("Configurações Pressionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
              child: ListTile(
                title: Text('Configurações'),
                leading: Icon(Icons.settings, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {
                debugPrint("Compartilhar Pressionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Construcao()));
              },
              child: ListTile(
                title: Text('Compartilhar'),
                leading: Icon(Icons.share, color: Colors.deepOrange),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                debugPrint("Sobre o app Pressionado");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
              child: ListTile(
                title: Text('Sobre o app'),
                leading: Icon(Icons.help, color: Colors.blue),
              ),
            )
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
          swiperimgs,
          imagecarousel,
          Padding(
            padding: EdgeInsets.all(paddingminimo * 2),
            child: Text('Texto 3',
                style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
