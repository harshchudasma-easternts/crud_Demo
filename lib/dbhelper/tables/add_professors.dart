import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const tableName = 'AddProfessor'; // table name
  static const databaseName = 'Education.db'; // database name
  late Database _database;
  static const columnid = "id"; // column name
  static const firstName = "FirstName"; // Column Name
  static const lastName = "LastName"; // Column Name
  static const emailAddress = "EmailAddress"; // Column Name
  static const joiningDate = "JoiningDate"; // Column Name
  static const password = "Password"; // Column Name
  static const confirmPassword = "ConfirmPassword"; // Column Name
  static const designation = "Designation"; // Column Name
  static const department = "Department"; // Column Name
  static const gender = "Gender"; // Column Name
  static const mobileNo = "MobileNo"; // Column Name
  static const address = "Address"; // Column Name
  static const imageFile = "ImageData"; // Column Name
  static const education = "Education"; // Column Name

  DBHelper.privateConstructor();
  static final DBHelper instance = DBHelper.privateConstructor();

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDiractory = await getApplicationDocumentsDirectory();
    String path = join(documentDiractory.path, databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
  }

  Future _onCreateDatabase(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableName 
      ($columnid INTEGER PRIMARY KEY AUTOINCREMENT,
      $firstName TEXT NOT NULL,
      $lastName TEXT NOT NULL,
      $emailAddress TEXT NOT NULL,
      $password TEXT NOT NULL,
      $confirmPassword TEXT NOT NULL,
      $designation TEXT NOT NULL,
      $department TEXT NOT NULL,
      $gender TEXT NOT NULL,
      $mobileNo TEXT NOT NULL,
      $address TEXT NOT NULL,
      $education TEXT NOT NULL)''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    Database db = await instance.database;
    List<Map<String, dynamic>>? listOfDataTable = await db.query(tableName);
    print("get all the data from the database ${listOfDataTable}");
    return listOfDataTable;
  }

  Future<List<Map<String, dynamic>>> delete(int id) async {
    Database db = await instance.database;
    await db.delete(tableName, where: '$columnid = ?', whereArgs: [id]);
    return await getAllData();
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnid];
    print("update data id : $id");
    return await db
        .update(tableName, row, where: '$columnid = ?', whereArgs: [id]);
  }

  Future close() async {
    Database db = await instance.database;
    return await db.close();
  }
}
