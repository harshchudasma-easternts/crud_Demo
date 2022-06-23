// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProfessorDatabaseData extends DataClass
    implements Insertable<ProfessorDatabaseData> {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String password;
  final String confirmPassword;
  final String designation;
  final String department;
  final String gender;
  final String mobileNo;
  final String? address;
  final String education;
  ProfessorDatabaseData(
      {required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.password,
      required this.confirmPassword,
      required this.designation,
      required this.department,
      required this.gender,
      required this.mobileNo,
      this.address,
      required this.education});
  factory ProfessorDatabaseData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProfessorDatabaseData(
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      emailAddress: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email_address'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      confirmPassword: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}confirm_password'])!,
      designation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}designation'])!,
      department: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}department'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      mobileNo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mobile_no'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      education: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}education'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email_address'] = Variable<String>(emailAddress);
    map['password'] = Variable<String>(password);
    map['confirm_password'] = Variable<String>(confirmPassword);
    map['designation'] = Variable<String>(designation);
    map['department'] = Variable<String>(department);
    map['gender'] = Variable<String>(gender);
    map['mobile_no'] = Variable<String>(mobileNo);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    map['education'] = Variable<String>(education);
    return map;
  }

  ProfessorDatabaseCompanion toCompanion(bool nullToAbsent) {
    return ProfessorDatabaseCompanion(
      firstName: Value(firstName),
      lastName: Value(lastName),
      emailAddress: Value(emailAddress),
      password: Value(password),
      confirmPassword: Value(confirmPassword),
      designation: Value(designation),
      department: Value(department),
      gender: Value(gender),
      mobileNo: Value(mobileNo),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      education: Value(education),
    );
  }

  factory ProfessorDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfessorDatabaseData(
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      password: serializer.fromJson<String>(json['password']),
      confirmPassword: serializer.fromJson<String>(json['confirmPassword']),
      designation: serializer.fromJson<String>(json['designation']),
      department: serializer.fromJson<String>(json['department']),
      gender: serializer.fromJson<String>(json['gender']),
      mobileNo: serializer.fromJson<String>(json['mobileNo']),
      address: serializer.fromJson<String?>(json['address']),
      education: serializer.fromJson<String>(json['education']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'password': serializer.toJson<String>(password),
      'confirmPassword': serializer.toJson<String>(confirmPassword),
      'designation': serializer.toJson<String>(designation),
      'department': serializer.toJson<String>(department),
      'gender': serializer.toJson<String>(gender),
      'mobileNo': serializer.toJson<String>(mobileNo),
      'address': serializer.toJson<String?>(address),
      'education': serializer.toJson<String>(education),
    };
  }

  ProfessorDatabaseData copyWith(
          {String? firstName,
          String? lastName,
          String? emailAddress,
          String? password,
          String? confirmPassword,
          String? designation,
          String? department,
          String? gender,
          String? mobileNo,
          String? address,
          String? education}) =>
      ProfessorDatabaseData(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        designation: designation ?? this.designation,
        department: department ?? this.department,
        gender: gender ?? this.gender,
        mobileNo: mobileNo ?? this.mobileNo,
        address: address ?? this.address,
        education: education ?? this.education,
      );
  @override
  String toString() {
    return (StringBuffer('ProfessorDatabaseData(')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password, ')
          ..write('confirmPassword: $confirmPassword, ')
          ..write('designation: $designation, ')
          ..write('department: $department, ')
          ..write('gender: $gender, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('address: $address, ')
          ..write('education: $education')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      firstName,
      lastName,
      emailAddress,
      password,
      confirmPassword,
      designation,
      department,
      gender,
      mobileNo,
      address,
      education);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfessorDatabaseData &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.emailAddress == this.emailAddress &&
          other.password == this.password &&
          other.confirmPassword == this.confirmPassword &&
          other.designation == this.designation &&
          other.department == this.department &&
          other.gender == this.gender &&
          other.mobileNo == this.mobileNo &&
          other.address == this.address &&
          other.education == this.education);
}

class ProfessorDatabaseCompanion
    extends UpdateCompanion<ProfessorDatabaseData> {
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> emailAddress;
  final Value<String> password;
  final Value<String> confirmPassword;
  final Value<String> designation;
  final Value<String> department;
  final Value<String> gender;
  final Value<String> mobileNo;
  final Value<String?> address;
  final Value<String> education;
  const ProfessorDatabaseCompanion({
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.password = const Value.absent(),
    this.confirmPassword = const Value.absent(),
    this.designation = const Value.absent(),
    this.department = const Value.absent(),
    this.gender = const Value.absent(),
    this.mobileNo = const Value.absent(),
    this.address = const Value.absent(),
    this.education = const Value.absent(),
  });
  ProfessorDatabaseCompanion.insert({
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
    required String confirmPassword,
    required String designation,
    required String department,
    required String gender,
    required String mobileNo,
    this.address = const Value.absent(),
    required String education,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        emailAddress = Value(emailAddress),
        password = Value(password),
        confirmPassword = Value(confirmPassword),
        designation = Value(designation),
        department = Value(department),
        gender = Value(gender),
        mobileNo = Value(mobileNo),
        education = Value(education);
  static Insertable<ProfessorDatabaseData> custom({
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? emailAddress,
    Expression<String>? password,
    Expression<String>? confirmPassword,
    Expression<String>? designation,
    Expression<String>? department,
    Expression<String>? gender,
    Expression<String>? mobileNo,
    Expression<String?>? address,
    Expression<String>? education,
  }) {
    return RawValuesInsertable({
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (emailAddress != null) 'email_address': emailAddress,
      if (password != null) 'password': password,
      if (confirmPassword != null) 'confirm_password': confirmPassword,
      if (designation != null) 'designation': designation,
      if (department != null) 'department': department,
      if (gender != null) 'gender': gender,
      if (mobileNo != null) 'mobile_no': mobileNo,
      if (address != null) 'address': address,
      if (education != null) 'education': education,
    });
  }

  ProfessorDatabaseCompanion copyWith(
      {Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? emailAddress,
      Value<String>? password,
      Value<String>? confirmPassword,
      Value<String>? designation,
      Value<String>? department,
      Value<String>? gender,
      Value<String>? mobileNo,
      Value<String?>? address,
      Value<String>? education}) {
    return ProfessorDatabaseCompanion(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      designation: designation ?? this.designation,
      department: department ?? this.department,
      gender: gender ?? this.gender,
      mobileNo: mobileNo ?? this.mobileNo,
      address: address ?? this.address,
      education: education ?? this.education,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (confirmPassword.present) {
      map['confirm_password'] = Variable<String>(confirmPassword.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (mobileNo.present) {
      map['mobile_no'] = Variable<String>(mobileNo.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (education.present) {
      map['education'] = Variable<String>(education.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfessorDatabaseCompanion(')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password, ')
          ..write('confirmPassword: $confirmPassword, ')
          ..write('designation: $designation, ')
          ..write('department: $department, ')
          ..write('gender: $gender, ')
          ..write('mobileNo: $mobileNo, ')
          ..write('address: $address, ')
          ..write('education: $education')
          ..write(')'))
        .toString();
  }
}

class $ProfessorDatabaseTable extends ProfessorDatabase
    with TableInfo<$ProfessorDatabaseTable, ProfessorDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfessorDatabaseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  @override
  late final GeneratedColumn<String?> emailAddress = GeneratedColumn<String?>(
      'email_address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _confirmPasswordMeta =
      const VerificationMeta('confirmPassword');
  @override
  late final GeneratedColumn<String?> confirmPassword =
      GeneratedColumn<String?>('confirm_password', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 50),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String?> designation = GeneratedColumn<String?>(
      'designation', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _departmentMeta = const VerificationMeta('department');
  @override
  late final GeneratedColumn<String?> department = GeneratedColumn<String?>(
      'department', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _mobileNoMeta = const VerificationMeta('mobileNo');
  @override
  late final GeneratedColumn<String?> mobileNo = GeneratedColumn<String?>(
      'mobile_no', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 12),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: false);
  final VerificationMeta _educationMeta = const VerificationMeta('education');
  @override
  late final GeneratedColumn<String?> education = GeneratedColumn<String?>(
      'education', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        firstName,
        lastName,
        emailAddress,
        password,
        confirmPassword,
        designation,
        department,
        gender,
        mobileNo,
        address,
        education
      ];
  @override
  String get aliasedName => _alias ?? 'professor_database';
  @override
  String get actualTableName => 'professor_database';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProfessorDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email_address')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['email_address']!, _emailAddressMeta));
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('confirm_password')) {
      context.handle(
          _confirmPasswordMeta,
          confirmPassword.isAcceptableOrUnknown(
              data['confirm_password']!, _confirmPasswordMeta));
    } else if (isInserting) {
      context.missing(_confirmPasswordMeta);
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    } else if (isInserting) {
      context.missing(_designationMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    } else if (isInserting) {
      context.missing(_departmentMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('mobile_no')) {
      context.handle(_mobileNoMeta,
          mobileNo.isAcceptableOrUnknown(data['mobile_no']!, _mobileNoMeta));
    } else if (isInserting) {
      context.missing(_mobileNoMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('education')) {
      context.handle(_educationMeta,
          education.isAcceptableOrUnknown(data['education']!, _educationMeta));
    } else if (isInserting) {
      context.missing(_educationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ProfessorDatabaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProfessorDatabaseData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProfessorDatabaseTable createAlias(String alias) {
    return $ProfessorDatabaseTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ProfessorDatabaseTable professorDatabase =
      $ProfessorDatabaseTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [professorDatabase];
}
