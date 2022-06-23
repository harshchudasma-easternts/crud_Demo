import 'package:drift/drift.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class ProfessorDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstName => text().withLength(min: 1, max: 50)();
  TextColumn get lastName => text().withLength(min: 1, max: 50)();
  TextColumn get emailAddress => text().withLength(min: 1, max: 50)();
  TextColumn get password => text().withLength(min: 1, max: 50)();
  TextColumn get confirmPassword => text().withLength(min: 1, max: 50)();
  TextColumn get designation => text().withLength(min: 1, max: 50)();
  TextColumn get department => text().withLength(min: 1, max: 50)();
  TextColumn get gender => text().withLength(min: 1, max: 50)();
  TextColumn get mobileNo => text().withLength(min: 1, max: 12)();
  TextColumn get address => text().nullable().withLength(min: 1, max: 200)();
  TextColumn get education => text().withLength(min: 1, max: 200)();
}

@DriftDatabase(tables: [ProfessorDatabase])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<ProfessorDatabaseData>> getAppProfessors() =>
      select(professorDatabase).get();
  Stream<List<ProfessorDatabaseData>> watchAppProfessors() =>
      select(professorDatabase).watch();
  Future insertProfessor(ProfessorDatabaseData professorDatabaseData) =>
      into(professorDatabase).insert(professorDatabaseData);
  Future updateProfessor(ProfessorDatabaseData professorDatabaseData) =>
      update(professorDatabase).replace(professorDatabaseData);
  Future deleteTask(ProfessorDatabaseData professorDatabaseData) =>
      delete(professorDatabase).delete(professorDatabaseData);
}
