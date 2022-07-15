class GetProfessor {
  List<Data>? _data;

  List<Data>? get data => _data;

  GetProfessor.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late int? _id;
  late String? _firstName;
  late String? _lastName;
  late String? _email;
  late String? _joining;
  late String? _password;
  late String? _designation;
  late String? _department;
  late String? _gender;
  late String? _mobileNo;
  late String? _address;
  late String? _education;
  late bool? _isActive;
  late String? _createdAt;
  late String? _updatedAt;
  late String? _addedBy;
  late String? _updatedBy;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get joining => _joining;
  String? get password => _password;
  String? get designation => _designation;
  String? get department => _department;
  String? get gender => _gender;
  String? get mobileNo => _mobileNo;
  String? get address => _address;
  String? get education => _education;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get addedBy => _addedBy;
  String? get updatedBy => _updatedBy;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'] ?? -1;
    _firstName = json['firstName'] ?? "-";
    _lastName = json['lastName'] ?? "-";
    _email = json['Email'] ?? "-";
    _joining = json['Joining'] ?? "-";
    _password = json['Password'] ?? "-";
    _designation = json['Designation'] ?? "-";
    _department = json['Department'] ?? "-";
    _gender = json['Gender'] ?? "=";
    _mobileNo = json['MobileNo'] ?? "-";
    _address = json['Address'] ?? "-";
    _education = json['Education'] ?? "-";
    _isActive = json['is_active'];
    _createdAt = json['created_at'] ?? "-";
    _updatedAt = json['updated_at'] ?? "-";
    _addedBy = json['added_by'] ?? "-";
    _updatedBy = json['updated_by'] ?? "-";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['Email'] = this._email;
    data['Joining'] = this._joining;
    data['Password'] = this._password;
    data['Designation'] = this._designation;
    data['Department'] = this._department;
    data['Gender'] = this._gender;
    data['MobileNo'] = this._mobileNo;
    data['Address'] = this._address;
    data['Education'] = this._education;
    data['is_active'] = this._isActive;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['added_by'] = this._addedBy;
    data['updated_by'] = this._updatedBy;
    return data;
  }
}
