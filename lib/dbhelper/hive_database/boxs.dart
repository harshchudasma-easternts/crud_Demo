import 'package:animation_demo/dbhelper/hive_database/hive_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Professors> getTransaction() => Hive.box<Professors>('Professors');
}
