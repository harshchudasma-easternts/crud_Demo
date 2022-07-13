class AddDataModel {
  Data? _data;

  AddDataModel({Data? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  Data? get data => _data;

  AddDataModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _joining;
  String? _password;
  String? _designation;
  String? _department;
  String? _gender;
  String? _mobileNo;
  String? _address;
  String? _education;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  Null? _addedBy;
  Null? _updatedBy;

  Data(
      {int? id,
        String? firstName,
        String? lastName,
        String? email,
        String? joining,
        String? password,
        String? designation,
        String? department,
        String? gender,
        String? mobileNo,
        String? address,
        String? education,
        bool? isActive,
        String? createdAt,
        String? updatedAt,
        Null? addedBy,
        Null? updatedBy}) {
    if (id != null) {
      this._id = id;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (joining != null) {
      this._joining = joining;
    }
    if (password != null) {
      this._password = password;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (department != null) {
      this._department = department;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (mobileNo != null) {
      this._mobileNo = mobileNo;
    }
    if (address != null) {
      this._address = address;
    }
    if (education != null) {
      this._education = education;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (addedBy != null) {
      this._addedBy = addedBy;
    }
    if (updatedBy != null) {
      this._updatedBy = updatedBy;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get joining => _joining;
  set joining(String? joining) => _joining = joining;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get mobileNo => _mobileNo;
  set mobileNo(String? mobileNo) => _mobileNo = mobileNo;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get education => _education;
  set education(String? education) => _education = education;
  bool? get isActive => _isActive;
  set isActive(bool? isActive) => _isActive = isActive;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Null? get addedBy => _addedBy;
  set addedBy(Null? addedBy) => _addedBy = addedBy;
  Null? get updatedBy => _updatedBy;
  set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['Email'];
    _joining = json['Joining'];
    _password = json['Password'];
    _designation = json['Designation'];
    _department = json['Department'];
    _gender = json['Gender'];
    _mobileNo = json['MobileNo'];
    _address = json['Address'];
    _education = json['Education'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _addedBy = json['added_by'];
    _updatedBy = json['updated_by'];
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
