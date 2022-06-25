// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfessorsAdapter extends TypeAdapter<Professors> {
  @override
  final int typeId = 0;

  @override
  Professors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Professors(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      emailAddress: fields[2] as String,
      password: fields[3] as String,
      confirmPassword: fields[4] as String,
      designation: fields[5] as String,
      department: fields[6] as String,
      gender: fields[7] as String,
      mobileNo: fields[8] as num,
      address: fields[9] as String,
      education: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Professors obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.emailAddress)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.confirmPassword)
      ..writeByte(5)
      ..write(obj.designation)
      ..writeByte(6)
      ..write(obj.department)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.mobileNo)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.education);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfessorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
