import 'package:flutter/material.dart';
import 'package:flutter_vidi6/database_helper.dart';
import "package:intl/intl.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIDI Demo - rad s bazom podataka',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VIDI Demo - rad s bazom podataka'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Čitanje podataka', style: TextStyle(fontSize: 20),),
              onPressed: () {_queryData();},
            ),
            RaisedButton(
              child: Text('Dodavanje podataka', style: TextStyle(fontSize: 20),),
              onPressed: () {_insertData();},
            ),
            RaisedButton(
              child: Text('Ažuriranje podataka', style: TextStyle(fontSize: 20),),
              onPressed: () {_updateData();},
            ),
            RaisedButton(
              child: Text('Brisanje podataka', style: TextStyle(fontSize: 20),),
              onPressed: () {_deleteData();},
            ),
          ],
        ),
      ),
    );
  }


  void _queryData() async {
    final allRows = await dbHelper.queryAllRows();
    print('Pregled svih podataka iz baze podataka:');
    allRows.forEach((row) => print(row));
  }

  void _insertData() async {
    String vrijeme = DateFormat('dd.MM.yyyy kk:mm:ss').format(DateTime.now());
    Map<String, dynamic> row = {
      DatabaseHelper.cPoruka : 'Test poruka ' + vrijeme,
      DatabaseHelper.cVrijeme  : vrijeme
    };
    final id = await dbHelper.insert(row);
    print('U bazu podataka je dodan novi slog s ID: $id');
  }

  void _updateData() async {
    String vrijeme = DateFormat('dd.MM.yyyy kk:mm:ss').format(DateTime.now());
    Map<String, dynamic> row = {
      DatabaseHelper.cID   : 1,
      DatabaseHelper.cPoruka : 'izmijenjena poruka ' + vrijeme,
      DatabaseHelper.cVrijeme  : vrijeme
    };
    final rowsAffected = await dbHelper.update(row);
    print('U bazi podataka je ažuriran slog $rowsAffected');
  }

  void _deleteData() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('U bazi podataka je obrisan slog $rowsDeleted s ID $id');
  }
}