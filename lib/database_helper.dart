import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "Vidi.db";
  static final _databaseVersion = 1;
  static final _table = 'poruke';

  static final cID = '_id';
  static final cPoruka = 'name';
  static final cVrijeme = 'age';


  // Priprema korištenje baze podataka od strane samo jedne aplikacije
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Kreiranje (ako ne postoji) i otvaranje baze podataka
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // kreiranej tablice za spremanje poruka
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_table (
            $cID INTEGER PRIMARY KEY,
            $cPoruka TEXT NOT NULL,
            $cVrijeme TEXT NOT NULL
          )
          ''');
  }


  // Metoda za pregled podataka u bazi
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_table);
  }

  // Metoda za vraćanje broja slogova u bazi podataka
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $_table'));
  }

  // Metoda za dodavanje podataka
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_table, row);
  }

  // Metoda za ažuriranje postojećih podataka
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[cID];
    return await db.update(_table, row, where: '$cID = ?', whereArgs: [id]);
  }

// Metoda za brisanje podataka
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_table, where: '$cID = ?', whereArgs: [id]);
  }
}