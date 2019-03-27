import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/pages/aparelhos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  /*
  //variavel checkbox bandeiras
  bool bandeira1 = false;
  bool bandeira2 = false;
  bool bandeira3 = false;
//  checkbox principal
  bool tarifa = false;
  void checktarifa(bool value) {
    setState(() {
      tarifa = value;
      bandeira1 = value;
      bandeira2 = false;
      bandeira3 = false;
    });
  }
//   bandeira 1
  void checkbandeira1(bool value) {
    setState(() {
      tarifa = value;
      bandeira1 = value;
      bandeira2 = false;
      bandeira3 = false;
    });
  }
  // bandeira 2
  void checkbandeira2(bool value) {
    setState(() {
      tarifa = value;
      bandeira2 = value;
      bandeira1 = false;
      bandeira3 = false;
    });
  }
  // bandeira 3
  void checkbandeira3(bool value) {
    setState(() {
      tarifa = value;
      bandeira3 = value;
      bandeira1 = false;
      bandeira2 = false;
    });
  }
  void switchtarifas1(bool value) {
    setState(() {
      return switchtarifas1(value);
//      switchtarifas1(value);
    });
  }
  final fundobandeira = Colors.black12;
*/
  var _controllerconsumo = TextEditingController();
  var _controllerreais =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

//  var _controllerreais = TextEditingController();
  var _controllerkwh = TextEditingController();

  String str_tarifa = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text('Configurações'),
      ),
      body: ListView(padding: EdgeInsets.all(10), children: <Widget>[
        // tarifas e impostos
//        ListTile(
//            title: Text(
//              'Configurações de Fatura',
//              style: TextStyle(fontSize: 18),
//              textAlign: TextAlign.center,
//            ),
//            subtitle: Text('AINDA EM DESENVOLVIMENTO',textAlign: TextAlign.center)),
//        Divider(),
        Container(
          height: 40,
          child: Text(
            'Calcule sua tarifa de energia:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
            child: TextField(
              controller: _controllerconsumo,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Consumo mais recente',
                  suffixText: ' kWh/mês',
                  suffixStyle: TextStyle(color: Colors.black, fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
              child: TextField(
                controller: _controllerreais,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Valor da conta mais recente',
//                    hintText: "Valor em reais (R\$), ex: 425",
                    prefixText: 'R\$ ',
                    prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                    helperText:
                        'Confira esses dados na sua fatura de energia elétrica',
//                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                textAlign: TextAlign.left,
              )),
          Padding(
              padding: EdgeInsets.only(top: 15, left: 50, right: 50, bottom: 0),
              child: Text(str_tarifa))
        ])),
        /*     
        Padding(
            padding: EdgeInsets.only(top: 15, left: 50, right: 50, bottom: 0),
            child: TextField(
                controller: _controllerkwh,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Valor do kWh na sua região',
                    hintText: "Confira na sua fatura, ex: 0.82",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                onChanged: (value) {
                  setState(() {});
                  debugPrint('Something changed in valor kwh Text Field');
                })),
        Padding(
            padding: EdgeInsets.only(left: 55, top: 2),
            child: Text(
              '* Não utilize vírgula, exemplo: 0.5',
              style: TextStyle(fontSize: 11),
            )),
   */
        Container(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 100, right: 100, top: 0),
          child: RaisedButton(
            child: Text('Salvar'),
            onPressed: () {
              setState(() {
                calculoTarifa();
                saveKwh();
                navigateToAparelhos();
              });
            },
          ),
        )
//        Divider(),

        /*
        SwitchListTile(
            title: Text('Adicionar Tarifas e Impostos'),
            subtitle: Text('Os valores podem divergir em cada região'),
            secondary: Icon(Icons.monetization_on),
            value:
//                tarifas1,
//                  _switchon,
                tarifa,
            onChanged:
//                switchtarifas1
                checktarifa),
//            CheckboxListTile(
//                title: Text('Adicionar Tarifas e Impostos'),
//                subtitle: Text('Os valores podem divergir em cada região'),
//                secondary: Icon(
//                  Icons.monetization_on,
////                  color: Colors.black45,
//                ),
//                value: tarifa,
//                onChanged: checktarifa),
        // bandeiras tarifárias
        Divider(),
        ListTile(
            title: Text(
              'Bandeiras Tarifárias',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            subtitle: Text('Condição da Geração de Energia no Brasil',
                style: TextStyle(fontSize: 16), textAlign: TextAlign.center)),
        CheckboxListTile(
            title: Text('Bandeira Verde'),
            subtitle: Text('Condições Favoráveis'),
            secondary: CircleAvatar(
              backgroundColor: fundobandeira,
              child: Icon(
                Icons.flag,
                color: Colors.green,
              ),
            ),
            value: bandeira1,
            onChanged: checkbandeira1),
        CheckboxListTile(
            title: Text('Bandeira Amarela'),
            subtitle: Text('Condições Menos Favoráveis'),
            secondary: CircleAvatar(
              backgroundColor: fundobandeira,
              child: Icon(
                Icons.flag,
                color: Colors.yellowAccent,
              ),
            ),
            value: bandeira2,
            onChanged: checkbandeira2),
        CheckboxListTile(
            title: Text('Bandeira Vermelha'),
            subtitle: Text('Condições Mais Custosas'),
            secondary: CircleAvatar(
              backgroundColor: fundobandeira,
              child: Icon(
                Icons.flag,
                color: Colors.red,
              ),
            ),
            value: bandeira3,
            onChanged: checkbandeira3),
        Divider()
        */
      ]),
    );
  }

  void saveKwh() {
    String kwh = str_tarifa;
    saveKwhPreference(kwh).then((bool committed) {});
  }

  void navigateToAparelhos() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Aparelhos()));
  }

  void calculoTarifa() {
    double consumo = double.parse(_controllerconsumo.text);
    double reais = _controllerreais.numberValue;
    double tarifa = reais / consumo;
//    tarifa.toStringAsFixed(2);
//    tarifa.roundToDouble();
    str_tarifa = '$tarifa';
  }
}

Future<bool> saveKwhPreference(String kwh) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
//  prefs.setString("kwh", kwh);
//  return await prefs.commit();
  return await prefs.setString('kwh', kwh);
}
