import 'package:animation_demo/api/api_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:animation_demo/model/get_professor_model.dart' as data;

class DatabaseProvider extends ChangeNotifier {
  bool isLoadingValue = true;
  bool isDataValue = false;
  List<Map<String, dynamic>> listofData = [];
  bool password = true;
  bool confirmPassword = true;
  String? selectedDepartment;
  String? selectedGender;
  bool isExpandedList = true;
  bool isSuccess = false;
  bool isLoading = false;
  List<data.Data>? tempList = [];

  passwordvisible() {
    password = !password;
    notifyListeners();
  }

  isExpandedListValue() {
    isExpandedList = !isExpandedList;
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
  // Future<void> insertData({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   // String? joiningDate,
  //   required String password,
  //   required String confirmPassword,
  //   required String designation,
  //   required String department,
  //   required String gender,
  //   required String mobileNo,
  //   String? address,
  //   // required String imagebase64String,
  //   required String education,
  // }) async {
  //   Map<String, dynamic> insertRow = {
  //     DBHelper.firstName: firstName,
  //     DBHelper.lastName: lastName,
  //     DBHelper.emailAddress: email,
  //     // DBHelper.joiningDate: joiningDate ?? DateTime.now(),
  //     DBHelper.password: password,
  //     DBHelper.confirmPassword: confirmPassword,
  //     DBHelper.designation: designation,
  //     DBHelper.department: department,
  //     DBHelper.gender: gender,
  //     DBHelper.mobileNo: mobileNo,
  //     DBHelper.address: address ?? "-",
  //     // DBHelper.imageFile: imagebase64String,
  //     DBHelper.education: education,
  //   };
  //   final id = await dbHelper.insert(insertRow);
  // }
  //
  // // data update for the database
  // Future<void> updateData({
  //   required int ColumnId,
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   // String? joiningDate,
  //   required String password,
  //   required String confirmPassword,
  //   required String designation,
  //   required String department,
  //   required String gender,
  //   required String mobileNo,
  //   String? address,
  //   // required String imagebase64String,
  //   required String education,
  // }) async {
  //   Map<String, dynamic> updateRow = {
  //     DBHelper.columnid: ColumnId,
  //     DBHelper.firstName: firstName,
  //     DBHelper.lastName: lastName,
  //     DBHelper.emailAddress: email,
  //     // DBHelper.joiningDate: joiningDate ?? DateTime.now(),
  //     DBHelper.password: password,
  //     DBHelper.confirmPassword: confirmPassword,
  //     DBHelper.designation: designation,
  //     DBHelper.department: department,
  //     DBHelper.gender: gender,
  //     DBHelper.mobileNo: mobileNo,
  //     DBHelper.address: address ?? "-",
  //     // DBHelper.imageFile: imagebase64String,
  //     DBHelper.education: education,
  //   };
  //   final id = await dbHelper.update(updateRow);
  // }

  // get all the data from the database
  getDatabaseData() {
    // dbHelper.getAllData().then(
    //   (value) {
    //     getDataFromDatabase(listofDataValue: value);
    //
    //   },
    // );
    isLoadingValue = false;
    notifyListeners();
  }

  getDataFromDatabase({List<Map<String, dynamic>>? listofDataValue}) {
    listofData = listofDataValue!;
    isLoadingValue = false;
    notifyListeners();
  }

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    ApiWrapper.getProfessorsList().then((value) {
      tempList = value!.data;
      isLoading = false;
      notifyListeners();
    });
  }

  void setLoader(value){
    isLoading = value;
    notifyListeners();
  }
}
