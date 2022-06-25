import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Professors extends HiveObject {
  Professors({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
    required this.designation,
    required this.department,
    required this.mobileNo,
    required this.gender,
    required this.address,
    required this.education,
  });

  @HiveField(0)
  late String firstName;

  @HiveField(1)
  late String lastName;

  @HiveField(2)
  late String emailAddress;

  @HiveField(3)
  late String password;

  @HiveField(4)
  late String confirmPassword;

  @HiveField(5)
  late String designation;

  @HiveField(6)
  late String department;

  @HiveField(7)
  late String gender;

  @HiveField(8)
  late num mobileNo;

  @HiveField(9)
  late String address;

  @HiveField(10)
  late String education;
}
