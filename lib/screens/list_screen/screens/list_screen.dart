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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Professors List",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ResponsiveWidget.isMobileScreen(context)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.notifications_outlined,
                            size: 24.0,
                          ),
                        )
                      : SizedBox(),
                  ResponsiveWidget.isMobileScreen(context)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.mail_outline,
                            size: 24.0,
                          ),
                        )
                      : SizedBox(),
                  ResponsiveWidget.isMobileScreen(context)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            height: 32.0,
                            width: 32.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  CommonImageConstats.profileImage,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
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
