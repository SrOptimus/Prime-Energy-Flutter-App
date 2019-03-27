import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/components/aparelhosconfig.dart';

/*
class AparelhosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Category(prod_name: 'Aparelho 1', prod_potency: '100'),
          Category(prod_name: 'Aparelho 2', prod_potency: '200'),
          Category(prod_name: 'Aparelho 3', prod_potency: '300'),
          Category(prod_name: 'Aparelho 4', prod_potency: '400'),
          Category(prod_name: 'Aparelho 5', prod_potency: '500'),
          Category(prod_name: 'Aparelho 6', prod_potency: '600'),
          Category(prod_name: 'Aparelho 7', prod_potency: '700'),
          Category(prod_name: 'Aparelho 8', prod_potency: '800'),
          Category(prod_name: 'Aparelho 9', prod_potency: '900'),
          Category(prod_name: 'Aparelho 10', prod_potency: '1000'),
        ],
      ),
    );
  }

  ListView getAparelhoListView(){
    TextStyle titleStyle=Theme.of(context).textTheme
  }
}

class Category extends StatelessWidget {
  String prod_name;
  String prod_potency;

  Category({this.prod_name, this.prod_potency});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.6),
        child: InkWell(
            child: Container(
              color: Colors.white10,
              child: ListTile(
                title: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    prod_name,
                    style: new TextStyle(fontSize: 16.0),
                  ),
                ),
                subtitle: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(prod_potency + ' Watts de potência',
                        style: new TextStyle(fontSize: 14.0))),
              ),
            ),
            onTap: () {
              navigateToDetail();
            }));
  }

  void navigateToDetail() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AparelhosConfig();
    }));
  }
}

*/
/*
class AparelhosList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AparelhosListState();
  }
}

class AparelhosListState extends State<AparelhosList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aparelhos Domésticos'),
        actions: <Widget>[
          //botão adicionar
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              debugPrint('Button + pressed');
              navigateToDetail();
            },
            tooltip: 'Adicionar Aparelho',
          ),
        ],
      ),
      body: getAparelhoListView(),
    );
  }

  ListView getAparelhoListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              'Dummy Title',
              style: titleStyle,
            ),
            subtitle: Text('Dummy Date'),
            trailing: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail();
            },
          ),
        );
      },
    );
  }

  void navigateToDetail() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AparelhosConfig();
    }));
  }
}

*/

//#################################################################

/*
class AparelhosList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return AparelhosListState();
  }
}

class AparelhosListState extends State<AparelhosList> {

  int count = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Aparelhos Domésticos'),
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Add button clicked');
          navigateToDetail('Add Note');
        },

        tooltip: 'Add Note',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getNoteListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),

            title: Text('Dummy Title', style: titleStyle,),

            subtitle: Text('Dummy Date'),

            trailing: Icon(Icons.delete, color: Colors.grey,),

            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail('Edit Note');
            },

          ),
        );
      },
    );
  }

  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AparelhosConfig();
    }));
  }
}
*/
