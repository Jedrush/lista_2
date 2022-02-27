import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lista_2/models/shopping_list_item_model.dart';
import 'package:lista_2/widgets/single_list_item_widget.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper with ChangeNotifier {
  DbHelper._();
  static DbHelper instance = DbHelper._();

  static final _dbVersion = 1;
  static final _dbName = 'my_database.db';
  static final _tableName = 'shopping_list_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final coumnQuantity = 'quantity';
  static final columnWeight = 'weight';
  static final columnType = 'type';

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database?> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    db.execute('''
CREATE TABLE $_tableName(
  $columnId INTEGER PRIMARY KEY,
$columnName TEXT NOT NULL,
$coumnQuantity INTEGER, 
$columnWeight REAL, 
$columnType TEXT
)
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;

    return await db!.query(_tableName);
  }

  Future<List<Map<String, dynamic>>> querySpecificTable(
      String queriedTable) async {
    Database? db = await instance.database;
    print(db!.query(queriedTable));

    return await db!.query(queriedTable);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> createNewTable(String newTableName) async {
    Database? db = await instance.database;
    db!.execute(
      'CREATE TABLE $newTableName($columnId INTEGER PRIMARY KEY, $columnName TEXT NOT NULL, $coumnQuantity INTEGER, $columnWeight REAL, $columnType TEXT)',
    );
  }

  Future<void> delete(int id) async {
    Database? db = await instance.database;
    //return
    await db!.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
    notifyListeners();
  }

  Future<void> dropTable() async {
    Database? db = await instance.database;
    return await db!.execute('DROP TABLE IF EXISTS $_tableName');
  }

  Future<void> createTable() async {
    Database? db = await instance.database;
    db!.execute(
        'CREATE TABLE $_tableName(  $columnId INTEGER PRIMARY KEY, $columnName TEXT NOT NULL, $coumnQuantity INTEGER, $columnWeight REAL, $columnType TEXT)');
  }

  Future<void> insertItem(ShoppingListItem item) async {
    // Get a reference to the database.
    final db = await instance.database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db!.insert(
      _tableName,
      toMap(item.id, item.productName, item.productType, item.quantity,
          item.weight),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Map<String, dynamic> toMap(
    int id,
    String productName,
    String? productType,
    int? quantity,
    double? weight,
  ) {
    return {
      '_id': id,
      'name': productName,
      'quantity': quantity,
      'weight': weight,
      'type': productType
    };
  }

  Future<List<ShoppingListItem>> items() async {
    // Get a reference to the database.
    final db = await instance.database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db!.query(_tableName);
    // print(maps);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    List<ShoppingListItem> item = List.generate(
        maps.length,
        (i) => ShoppingListItem(
              id: maps[i]['_id'],
              productName: maps[i]['name'],
              productType: maps[i]['type'] != null ? maps[i]['type'] : null,
              quantity:
                  maps[i]['quantity'] != null ? maps[i]['quantity'] : null,
              weight: maps[i]['weight'] != null ? maps[i]['weight'] : null,
            ));
    notifyListeners();
    // print(item);
    return item;
  }
}
