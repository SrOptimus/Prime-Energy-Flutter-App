import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/models/database.dart';
import 'package:flutter_prime_energy/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AparelhosConfig extends StatefulWidget {
  final String appBarTitle;
  final DatabaseA note;

  AparelhosConfig(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return _AparelhosConfigState(this.note, this.appBarTitle);
  }
}

class _AparelhosConfigState extends State<AparelhosConfig> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  DatabaseA note;

  _AparelhosConfigState(this.note, this.appBarTitle);

  //dropdown menu
  static var comodos = ['Sala', 'Quarto', 'Cozinha', 'Outro'];

  // tamanho padding (espaçamento)
  final padmin = 5.0;

  // variavel pra retirar valores dos textfield
  var nameControlled = TextEditingController();
  var qtdControlled = TextEditingController();
  var horadiaControlled = TextEditingController();
  var diamesControlled = TextEditingController();
  var potenciaControlled = TextEditingController();
  var controllerkwh = TextEditingController();
  var valorkwh = TextEditingController();
  String _kwh = '0.5';

//  var resultadoAparelhoReaisControlled = TextEditingController();
//  var resultadoAparelhoConsumoControlled = TextEditingController();
//  var resultadoAparelho1 = '';
//  var resultadoAparelhoConsumo = '';

  @override
  void initState() {
    getKwhPreference().then(updateKwh);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nameControlled.text = note.name;
    qtdControlled.text = note.qtd;
    horadiaControlled.text = note.horadia;
    diamesControlled.text = note.diames;
    potenciaControlled.text = note.potencia;
    valorkwh.text = _kwh;
    controllerkwh.text = _kwh;

//    resultadoAparelho1 = resultadoAparelhoReaisControlled.text;
//    resultadoAparelhoReaisControlled.text = note.gasto;
//    resultadoAparelhoConsumo = resultadoAparelhoConsumoControlled.text;
//    resultadoAparelhoConsumoControlled.text = note.consumokwh;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.2,
            // nome appbar
            title: Text(appBarTitle),
            // botao voltar
            leading: IconButton(
                icon: Icon(Icons.arrow_back), onPressed: moveToLastScreen),
            actions: <Widget>[
              //botão deletar
              IconButton(
                icon: Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  setState(() {
                    debugPrint('Botão Deletar pressionado');
                    _delete();
                  });
                },
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(padmin),
            child: ListView(
              children: <Widget>[
//                getImageAsset(),
                // Texto Nome
                Padding(
                    padding: EdgeInsets.only(
                        top: padmin,
                        bottom: padmin,
                        right: padmin * 1.5,
                        left: padmin * 1.5),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Nome do Aparelho',
                          hintText: "Nome do aparelho, exemplo: Computador",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.keyboard),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: nameControlled,
                      onChanged: (value) {
                        debugPrint('Something changed in nome Text Field');
                        updateName();
                      },
                    )),
                // Texto Quantidade
                Padding(
                    padding: EdgeInsets.only(
                        top: padmin,
                        bottom: padmin,
                        right: padmin * 1.5,
                        left: padmin * 1.5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Quantidade',
                          hintText: "Quantos desse aparelho você usa? ex: 2",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.playlist_add),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: qtdControlled,
                      onChanged: (value) {
                        debugPrint('Something changed in qtd Text Field');
                        updateQtd();
                      },
                    )),
                // Text Hora Dia
                Padding(
                    padding: EdgeInsets.only(
                        top: padmin,
                        bottom: padmin,
                        right: padmin * 1.5,
                        left: padmin * 1.5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Horas por dia',
                          hintText:
                              "Quantas horas por dia você o utiliza? ex: 8",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.access_time),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: horadiaControlled,
                      onChanged: (value) {
                        debugPrint('Something changed in HoraDia Text Field');
                        updateHoradia();
                      },
                    )),
                // Text Dia Mes
                Padding(
                    padding: EdgeInsets.only(
                        top: padmin,
                        bottom: padmin,
                        right: padmin * 1.5,
                        left: padmin * 1.5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Dias por mês',
                          hintText: "Quantos dias/mês você o utiliza? ex: 30",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.date_range),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: diamesControlled,
                      onChanged: (value) {
                        debugPrint('Something changed in DiaMes Text Field');
                        updateDiames();
                      },
                    )),
                // Text Potencia
                Padding(
                    padding: EdgeInsets.only(
                        top: padmin,
                        bottom: padmin,
                        right: padmin * 1.5,
                        left: padmin * 1.5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Potência',
                          hintText: "Confira no manual a potência, ex: 250",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.flash_on),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      controller: potenciaControlled,
                      onChanged: (value) {
                        debugPrint('Something changed in potencia Text Field');
                        updatePotencia();
                      },
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: padmin * 1,
                        bottom: padmin * 1,
                        left: padmin * 5,
                        right: padmin * 5),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Text('Cômodo da casa:',
                              style: TextStyle(fontSize: 16))),
                      Expanded(
                          child: DropdownButton(
                        items: comodos.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        value: getPriorityAsString(note.room),
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            debugPrint('$valueSelectedByUser selecionado');
                            updatePriorityAsInt(valueSelectedByUser);
                          });
                        },
                      ))
                    ])),
                // Text Kwh
                Center(
                  child: Text('Valor do kWh: R\$ ' + controllerkwh.text,
                      style: TextStyle(fontSize: 16)),
                ),
                Padding(
                    padding: EdgeInsets.all(padmin * 2),
                    child: Row(
                      children: <Widget>[
                        // botao confirma
                        Expanded(
                            child: RaisedButton(
                                child: Text('Confirmar'),
                                onPressed: () {
                                  setState(() {
                                    debugPrint('Botão Confirmar pressionado');
                                    _calculoAparelho();
                                    _save();
                                    debugPrint("Salvo");
                                  });
                                })),
                        // separação entre os botoes
                        Container(width: padmin * 4),
                        // botao limpar
                        Expanded(
                            child: RaisedButton(
                          child: Text('Limpar'),
                          onPressed: () {
                            setState(() {
                              _reset();
                              debugPrint('Botão Limpar pressionado');
                            });
                          },
                        )),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/raio.png');
    Image image = Image(
      image: assetImage,
      width: 100,
      height: 100,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(padmin * 3),
    );
  }

  void _calculoAparelho() {
    double quantidade = double.parse(qtdControlled.text);
    double horadia = double.parse(horadiaControlled.text);
    double diames = double.parse(diamesControlled.text);
    double potencia = double.parse(potenciaControlled.text);
    double kwh = double.parse(controllerkwh.text);
    // calculo kwh
    double kwhAparelho = (potencia * horadia * diames * quantidade / 1000);
    note.consumokwh = '$kwhAparelho';
    // valor em reais
    double totalAparelho = (kwhAparelho * kwh);
    String totalAparelhoFormat = totalAparelho.toStringAsPrecision(4);
//    note.gasto = '$totalAparelho';
    note.gasto = '$totalAparelhoFormat';
  }

  // Função Resetar
  void _reset() {
    nameControlled.clear();
    qtdControlled.clear();
    horadiaControlled.clear();
    diamesControlled.clear();
    potenciaControlled.clear();
    updateName();
    updateQtd();
    updateHoradia();
    updateDiames();
    updatePotencia();
  }

// Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'Sala':
        note.room = 1;
        break;
      case 'Quarto':
        note.room = 2;
        break;
      case 'Cozinha':
        note.room = 3;
        break;
      case 'Outro':
        note.room = 4;
        break;
    }
  }

// Convert int priority to String priority and display it to user in DropDown
  String getPriorityAsString(int value) {
    String room;
    switch (value) {
      case 1:
        room = comodos[0];
        break;
      case 2:
        room = comodos[1];
        break;
      case 3:
        room = comodos[2];
        break;
      case 4:
        room = comodos[3];
        break;
    }
    return room;
  }

  // Update the name
  void updateName() {
    note.name = nameControlled.text;
  }

  // Update the quantidade
  void updateQtd() {
    note.qtd = qtdControlled.text;
  }

  // Update the horadia
  void updateHoradia() {
    note.horadia = horadiaControlled.text;
  }

  // Update the diames
  void updateDiames() {
    note.diames = diamesControlled.text;
  }

  // Update the potency
  void updatePotencia() {
    note.potencia = potenciaControlled.text;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();
//    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Salvo com sucesso');
    } else {
      // Failure
      _showAlertDialog('Vish..', 'Problema ao salvar');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Ops..', 'Nada foi deletado');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Deletado com sucesso');
    } else {
      _showAlertDialog('Errr..', 'Um erro ocorreu ao deletar isso');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void updateKwh(String kwh) {
    setState(() {
      this._kwh = kwh;
    });
  }
}

Future<String> getKwhPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String kwh = prefs.getString("kwh");
//  return kwh;
  return prefs.getString('kwh');
}
