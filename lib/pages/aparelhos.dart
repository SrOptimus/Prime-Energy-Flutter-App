import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/models/database.dart';
import 'package:flutter_prime_energy/pages/firstpage.dart';
import 'package:flutter_prime_energy/pages/settings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_prime_energy/utils/database_helper.dart';
import 'dart:async';
import 'package:flutter_prime_energy/components/aparelhosconfig.dart';

class Aparelhos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AparelhosState();
  }
}

class AparelhosState extends State<Aparelhos> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DatabaseA> aparelhosList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (aparelhosList == null) {
      aparelhosList = List<DatabaseA>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text('Seus Aparelhos'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              debugPrint("Voltar Pressionado");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPage()));
            }),
        actions: <Widget>[
          // botão config
          IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                setState(() {
                  navigateToSettings();
                });
              })
        ],
      ),
      body: Stack(children: <Widget>[
        textoTotal(),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: getNoteListView(),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        elevation: 0.2,
        onPressed: () {
          debugPrint('Add button clicked');
          navigateToDetail(
              DatabaseA('', '', '', '', '', '', '', 4), 'Adicionar Aparelho');
        },
        tooltip: 'Adicionar Aparelho',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget textoTotal() {
    return Container(
      height: 50,
      child: Center(
        child: Text(
          'Total: [não implementado]',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getPriorityColor(this.aparelhosList[position].room),
              child: getPriorityIcon(this.aparelhosList[position].room),
            ),
            title: Text(
              this.aparelhosList[position].name +
                  ' / ' +
                  this.aparelhosList[position].potencia +
                  ' W',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
                'Quantidade: ' +
                    this.aparelhosList[position].qtd +
                    '\n' +
                    'Consumo: ' +
                    this.aparelhosList[position].consumokwh +
                    ' kWh/mês' +
                    '\n' +
                    'Custo mensal: R\$ ' +
                    this.aparelhosList[position].gasto,
                style: Theme.of(context).textTheme.body1),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.black54,
              ),
              onTap: () {
                _delete(context, aparelhosList[position]);
              },
            ),
            onTap: () {
              debugPrint('Item Pressionado');
              navigateToDetail(this.aparelhosList[position],
                  'Editar: ' + this.aparelhosList[position].name);
            },
          ),
        );
      },
    );
  }

  // Prioridade cor
  Color getPriorityColor(int room) {
    switch (room) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.blue;
        break;
      case 3:
        return Colors.deepPurpleAccent;
        break;
      case 4:
        return Colors.green;
        break;
      default:
        return Colors.black;
    }
  }

  // Prioridade ícone
  Icon getPriorityIcon(int room) {
    switch (room) {
      case 1:
        return Icon(Icons.personal_video, color: Colors.white);
        break;
      case 2:
        return Icon(Icons.airline_seat_individual_suite, color: Colors.white);
        break;
      case 3:
        return Icon(Icons.kitchen, color: Colors.white);
        break;
      default:
        return Icon(
          Icons.home,
          color: Colors.white,
        );
    }
  }

  // função deletar
  void _delete(BuildContext context, DatabaseA note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Deletado com sucesso');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(DatabaseA note, String name) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AparelhosConfig(note, name);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<DatabaseA>> aparelhosListFuture =
          databaseHelper.getNoteList();
      aparelhosListFuture.then((aparelhosList) {
        setState(() {
          this.aparelhosList = aparelhosList;
          this.count = aparelhosList.length;
        });
      });
    });
  }

  void navigateToSettings() {
    debugPrint("Configurações Pressionado");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }
}
