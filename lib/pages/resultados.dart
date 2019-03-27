import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/models/database.dart';
import 'package:flutter_prime_energy/pages/aparelhos.dart';
import 'package:flutter_prime_energy/pages/firstpage.dart';
import 'package:flutter_prime_energy/utils/database_helper.dart';

class Resultados extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultadosState();
  }
}

class _ResultadosState extends State<Resultados> {
//  ?
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DatabaseA> valorList;
  int count = 0;

  /*
  // total casa
  TextEditingController casarsControlled = TextEditingController();
  TextEditingController casakwControlled = TextEditingController();
  // total sala
  TextEditingController salarsControlled = TextEditingController();
  TextEditingController salakwControlled = TextEditingController();
  // total quarto
  TextEditingController quartorsControlled = TextEditingController();
  TextEditingController quartokwControlled = TextEditingController();
  // total cozinha
  TextEditingController cozinharsControlled = TextEditingController();
  TextEditingController cozinhakwControlled = TextEditingController();
  // total outros
  TextEditingController outrosrsControlled = TextEditingController();
  TextEditingController outroskwControlled = TextEditingController();
*/

  // total casa
  String casarsControlled = '';
  String casakwControlled = '';

  // total sala
  String salarsControlled = '';
  String salakwControlled = '';

  // total quarto
  String quartorsControlled = '';
  String quartokwControlled = '';

  // total cozinha
  String cozinharsControlled = '';
  String cozinhakwControlled = '';

  // total outros
  String outrosrsControlled = '';
  String outroskwControlled = '';

  @override
  Widget build(BuildContext context) {
    /*
    // total casa
      casarsControlled =
      casakwControlled =
    // total sala
      salarsControlled =
      salakwControlled =
    // total quarto
      quartorsControlled =
      quartokwControlled =
    // total cozinha
      cozinharsControlled =
      cozinhakwControlled =
    // total outros
      outrosrsControlled =
      outroskwControlled =
    */
//    ?
    if (valorList == null) {
      valorList = List<DatabaseA>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Seu Consumo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.format_list_bulleted, color: Colors.white),
              onPressed: () {
                debugPrint("List Pressionado");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aparelhos()));
              })
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              debugPrint("Voltar Pressionado");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPage()));
            }),
      ),
      body: Container(
        height: 50,
        margin: EdgeInsets.only(top: 15),
        child: Text(
          'AINDA NÃO IMPLEMENTADO',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

/*
  ListView getNoteListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  this.valorList[position].name,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  'teste',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.personal_video,
                    color: Colors.black,
                  ),
                ),
              ));
        });
  }
*/
/*
          (
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'AINDA NÃO IMPLEMENTADO',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            // resultado total
            ListTile(
              onTap: () {},
              title: Text(
                'Consumo total da casa:\nR\$ ' + casarsControlled + this.valorList[position].gasto,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                casakwControlled + ' kWh/mês',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            // resultado sala
            ListTile(
              onTap: () {},
              title: Text(
                'Consumo da sala:\nR\$ ' + salarsControlled,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                salakwControlled + ' kWh/mês',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            // resultado quarto
            ListTile(
              onTap: () {},
              title: Text(
                'Consumo do(s) quarto(s):\nR\$ ' + quartorsControlled,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                quartokwControlled + ' kWh/mês',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            // resultado cozinha
            ListTile(
              onTap: () {},
              title: Text(
                'Consumo da cozinha:\nR\$ ' + cozinharsControlled,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                cozinhakwControlled + ' kWh/mês',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            // resultado outros
            ListTile(
              onTap: () {},
              title: Text(
                'Consumo em outros cômodos:\nR\$ ' + outrosrsControlled,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                outroskwControlled + ' kWh/mês',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
          ],
        ));
  }
  */

}
