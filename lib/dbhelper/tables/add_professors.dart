import 'package:sqflite/sqflite.dart';

class DBHelper{
  static const tableName = 'AddProfessor'; // table name
  static const databaseName = 'Education.db'; // database name
  late Database _database;
  static const id = "id"; // column name
  static const firstName = "FirstName"; // Column Name
  static const lastName = "LastName"; // Column Name
  static const emailAddress = "EmailAddress"; // Column Name
  static const joiningDate = "JoiningDate"; // Column Name
  static const password = "Password"; // Column Name
  static const confirmPassword = "ConfirmPassword"; // Column Name
  static const designation = "Designatin"; // Column Name
  static const department = "Department"; // Column Name
  static const gender = "Gender"; // Column Name
  static const mobileNo = "MobileNo."; // Column Name
  static const address = "Address"; // Column Name
  static const imageFile = "ImageData"; // Column Name
  static const education = "Education"; // Column Name

  DBHelper.privateConstructor();
  static final DBHelper instance = DBHelper.privateConstructor();

  

}