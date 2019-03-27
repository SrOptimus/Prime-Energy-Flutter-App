// Model Class
class DatabaseA {
  int _id;
  String _name;
  String _qtd;
  String _horadia;
  String _diames;
  String _potencia;
  String _consumokwh;
  String _gasto;
  int _room;

  DatabaseA(this._name, this._qtd, this._horadia, this._diames, this._potencia,
      this._consumokwh, this._gasto, this._room);

  DatabaseA.withId(this._id, this._name, this._qtd, this._horadia, this._diames,
      this._potencia, this._consumokwh, this._gasto, this._room);

  int get id => _id;

  String get name => _name;

  String get qtd => _qtd;

  String get horadia => _horadia;

  String get diames => _diames;

  String get potencia => _potencia;

  String get consumokwh => _consumokwh;

  String get gasto => _gasto;

  int get room => _room;

  set name(String newName) {
    if (newName.length <= 30) {
      this._name = newName;
    }
  }

  set qtd(String newQtd) {
    this._qtd = newQtd;
  }

  set horadia(String newHoradia) {
    this._horadia = newHoradia;
  }

  set diames(String newDiames) {
    this._diames = newDiames;
  }

  set potencia(String newPotencia) {
    this._potencia = newPotencia;
  }

  set consumokwh(String newConsumoKWH) {
    this._consumokwh = newConsumoKWH;
  }

  set gasto(String newGasto) {
    this._gasto = newGasto;
  }

  set room(int newRoom) {
    if (newRoom >= 1 && newRoom <= 4) {
      this._room = newRoom;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['qtd'] = _qtd;
    map['horadia'] = _horadia;
    map['diames'] = _diames;
    map['potencia'] = _potencia;
    map['consumokwh'] = _consumokwh;
    map['gasto'] = _gasto;
    map['room'] = _room;

    return map;
  }

// Extract a Note object from a Map object
  DatabaseA.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._qtd = map['qtd'];
    this._horadia = map['horadia'];
    this._diames = map['diames'];
    this._potencia = map['potencia'];
    this._consumokwh = map['consumokwh'];
    this._gasto = map['gasto'];
    this._room = map['room'];
  }
}
