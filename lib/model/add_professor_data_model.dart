import 'dart:convert';

AddProfessorModel sendDataModelFromJson(String str) => AddProfessorModel.fromJson(json.decode(str));

String sendDataModelToJson(AddProfessorModel data) => json.encode(data.toJson());

class AddProfessorModel {
  AddProfessorModel({
    this.firstName,
    this.lastName,
    this.email,
    this.joiningDate,
    this.password,
    this.designation,
    this.department,
    this.gender,
    this.mobileNo,
    this.address,
    this.education,
    this.isActive = true,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? joiningDate;
  String? password;
  String? designation;
  String? department;
  String? gender;
  String? mobileNo;
  String? address;
  String? education;
  bool isActive;

  factory AddProfessorModel.fromJson(Map<String, dynamic> json) => AddProfessorModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["Email"],
    joiningDate: json["Joining"],
    password: json["Password"],
    designation: json["Designation"],
    department: json["Department"],
    gender: json["Gender"],
    mobileNo: json["MobileNo"],
    address: json["Address"],
    education: json["Education"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "firstName" : firstName,
    "lastName": lastName,
    "Email": email,
    "Joining": joiningDate,
    "Password": password,
    "Designation": designation,
    "Department": department,
    "Gender": gender,
    "MobileNo": mobileNo,
    "Address": address,
    "Education": education,
    "is_active": isActive,
  };
}
