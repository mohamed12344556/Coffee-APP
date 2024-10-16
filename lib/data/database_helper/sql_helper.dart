import 'dart:developer';

import '../models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null && _db!.isOpen) {
      return _db;
    }
    _db = await initialDB();
    return _db;
  }

  // OnCreate function to create the table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Coffees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        price REAL NOT NULL,
        image TEXT NOT NULL
      )
    ''');
  }

  // Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    log('onUpgrade called');
    // await db.execute('ALERT TABLE Notes ADD COLUMN newColumn TEXT');
  }

  // Initialize the database
  Future<Database> initialDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'coffee.db');
    Database db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  // Delete the database
  Future<void> deleteDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'coffee.db');
    await deleteDatabase(path);
    debugPrint('Database has been deleted: $path');
  }

  // Read from the database and convert the data to List<CoffeeModel>

  Future<List<CoffeeModel>> readDB() async {
    final myDB = await db;
    final List<Map<String, dynamic>> response = await myDB!.query('Coffees');
    final List<CoffeeModel> notes =
        response.map((row) => CoffeeModel.fromMap(row)).toList();
    debugPrint(notes.toString());
    return notes;
  }

  // Insert into the database

  Future<void> insertDB(
      {required String name,
      required String type,
      required double price,
      required String image}) async {
    final myDB = await db;
    int response = await myDB!.insert(
      'Coffees',
      {
        'name': name,
        'type': type,
        'price': price,
        'image': image,
      },
    );
    debugPrint('Insert Response: $response');
    // return response;
  }

  // Delete from the database

  Future<void> deleteFDB({required int id}) async {
    final myDB = await db;
    // int response =
    await myDB!.delete('Coffees', where: 'id = ?', whereArgs: [id]);
    // return response;
  }

  // Update the database

  Future<void> updateDB(
      {required String title,
      required String type,
      required double price,
      required String image,
      required int id}) async {
    final myDB = await db;
    int response = await myDB!.update(
        'Coffees',
        {
          'name': title,
          'type': type,
          'price': price,
          'image': image,
        },
        where: 'id = ?',
        whereArgs: [id]);
    debugPrint('Update Response: $response');
    // return response;
  }
}
