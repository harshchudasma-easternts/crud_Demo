import 'package:animation_demo/common_widgets/header_navbar_widget.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:animation_demo/screens/list_screen/widgets/all_prefessors_list.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  static const routeName = "/";
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: ResponsiveWidget.isMobileScreen(context)
              ? Size.fromHeight(50.0)
              : Size.fromHeight(60.0),
          child: HeaderNavigationBar(),
        ),
        body: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Professors List",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AllProfessorsList(),
            ],
          ),
        ),
      ),
    );
  }
}
