import 'package:animation_demo/dbhelper/hive_database/hive_model.dart';
import 'package:animation_demo/dbhelper/tables/add_professors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../dbhelper/hive_database/boxs.dart';

class DatabaseProvider extends ChangeNotifier {
  final dbHelper = DBHelper.instance;
  bool isLoadingValue = true;
  bool isDataValue = false;
  List<Map<String, dynamic>> listofData = [];
  bool password = true;
  bool confirmPassword = true;
  String? selectedDepartment;
  String? selectedGender;
  List<Professors>? listOfProfessors;

  passwordvisible() {
    password = !password;
    notifyListeners();
  }

  changePasswordVisible() {
    confirmPassword = !confirmPassword;
    notifyListeners();
  }

  selectedGenderValue({String? selectedValue}) {
    selectedGender = selectedValue;
    notifyListeners();
  }

  selectedDepartmentValue({String? selectedValue}) {
    selectedDepartment = selectedValue;
    notifyListeners();
  }

  // data insert to the database
  Future<void> insertData({
    required String firstName,
    required String lastName,
    required String email,
    // String? joiningDate,
    required String password,
    required String confirmPassword,
    required String designation,
    required String department,
    required String gender,
    required String mobileNo,
    String? address,
    // required String imagebase64String,
    required String education,
  }) async {
    Map<String, dynamic> insertRow = {
      DBHelper.firstName: firstName,
      DBHelper.lastName: lastName,
      DBHelper.emailAddress: email,
      // DBHelper.joiningDate: joiningDate ?? DateTime.now(),
      DBHelper.password: password,
      DBHelper.confirmPassword: confirmPassword,
      DBHelper.designation: designation,
      DBHelper.department: department,
      DBHelper.gender: gender,
      DBHelper.mobileNo: mobileNo,
      DBHelper.address: address ?? "-",
      // DBHelper.imageFile: imagebase64String,
      DBHelper.education: education,
    };
    final id = await dbHelper.insert(insertRow);
  }

  // data update for the database
  Future<void> updateData({
    required int ColumnId,
    required String firstName,
    required String lastName,
    required String email,
    // String? joiningDate,
    required String password,
    required String confirmPassword,
    required String designation,
    required String department,
    required String gender,
    required String mobileNo,
    String? address,
    // required String imagebase64String,
    required String education,
  }) async {
    Map<String, dynamic> updateRow = {
      DBHelper.columnid: ColumnId,
      DBHelper.firstName: firstName,
      DBHelper.lastName: lastName,
      DBHelper.emailAddress: email,
      // DBHelper.joiningDate: joiningDate ?? DateTime.now(),
      DBHelper.password: password,
      DBHelper.confirmPassword: confirmPassword,
      DBHelper.designation: designation,
      DBHelper.department: department,
      DBHelper.gender: gender,
      DBHelper.mobileNo: mobileNo,
      DBHelper.address: address ?? "-",
      // DBHelper.imageFile: imagebase64String,
      DBHelper.education: education,
    };
    final id = await dbHelper.update(updateRow);
  }

  // get all the data from the database
  getDatabaseData() {
    dbHelper.getAllData().then(
      (value) {
        getDataFromDatabase(listofDataValue: value);
      },
    );
  }

  getDataFromDatabase({List<Map<String, dynamic>>? listofDataValue}) {
    listofData = listofDataValue!;
    isLoadingValue = false;
    notifyListeners();
  }

  // Future addHiveDatabaseTransaction(
  //     String firstName,
  //     String lastName,
  //     String emailAddress,
  //     String password,
  //     String confirmPassword,
  //     String designation,
  //     String department,
  //     String gender,
  //     num mobileNO,
  //     String address,
  //     String education) {
  //   final addProfessor = Professors()
  //     ..firstName = firstName
  //     ..lastName = lastName
  //     ..emailAddress = emailAddress
  //     ..password = password
  //     ..confirmPassword = confirmPassword
  //     ..designation = designation
  //     ..department = department
  //     ..gender = gender
  //     ..mobileNo = mobileNO
  //     ..address = address
  //     ..education = education;

  //   final box = Boxes.getTransaction();
  //   box.add(addProfessor);
  //   print("box related print ${box}");
  //   notifyListeners();
  //   return box.add(addProfessor);
  // }
}
