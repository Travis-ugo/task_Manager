import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';
import 'grosary_class.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'power.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    Create Table power(
      id INTERGER PRIMARTY KEY,
      name TEXT
    )
    ''');
  }

  Future<List<Grosery>> getGrosries() async {
    Database db = await instance.database;
    var groceries = await db.query('power', orderBy: 'name');
    List<Grosery> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Grosery.fromMap(c)).toList()
        : [];

    return groceryList;
  }

  Future<int> add(Grosery powers) async {
    Database db = await instance.database;
    return await db.insert('power', powers.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('power', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> upDate(Grosery grosery) async {
    Database db = await instance.database;
    return await db.update(
      'power',
      grosery.toMap(),
      where: 'id = ?',
      whereArgs: [grosery.id],
    );
  }
}
