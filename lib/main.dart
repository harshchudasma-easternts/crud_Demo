import 'dart:io';

import 'package:animation_demo/dbhelper/hive_database/hive_model.dart';
import 'package:animation_demo/provider_demo.dart/database_provider.dart';
import 'package:animation_demo/screens/form_screens/screens/AdmissionForm.dart';
import 'package:animation_demo/screens/list_screen/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProfessorsAdapter());
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: ListScreen.routeName,
        title: "CRUD Demo",
        debugShowCheckedModeBanner: false,
        routes: {
          ListScreen.routeName: (context) => ListScreen(),
          AdmissionForm.routeName: (context) => AdmissionForm(isEdit: false),
        },
      ),
    );
  }
}
