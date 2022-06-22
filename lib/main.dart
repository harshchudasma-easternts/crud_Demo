import 'package:animation_demo/provider_demo.dart/database_provider.dart';
import 'package:animation_demo/screens/form_screens/screens/AdmissionForm.dart';
import 'package:animation_demo/screens/list_screen/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(
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
