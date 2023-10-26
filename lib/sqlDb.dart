// ignore_for_file: unused_local_variable, avoid_print

import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{


  static Database? _db ;

  Future<Database?> get db async{
    if(_db == null){
      _db = await initialDb();
      return _db;
    }else{
    return _db;
    }

  }



 Future<Database> initialDb() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'health.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return mydb;

  }

  _onUpgrade(Database db , int oldversion ,int newversion){


    print("onUpgrade=========================");

  }

  _onCreate(Database db, int version) async{
    await db.execute(''' 
     CREATE TABLE "users" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT,
      "email" TEXT,
      "password" TEXT 
    )
    ''');
        await db.execute(''' 
     CREATE TABLE "profile" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "email" TEXT,
      profile_picture BLOB 
    )
    ''');
    print("Create database and table");

  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await this.db;
    return db!.query('users');
  }
  Future<void> addUser(String name, String email, String password) async {
    final db = await this.db;
    await db!.insert('users', {'name': name, 'email': email, 'password': password});
  }

  Future<void> addPicture(String email, Uint8List profilePicture) async{
    final db = await this.db;
    await db!.insert('profile', {'email' : email, 'profile_picture' : profilePicture});
  }
}