import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:animation_demo/screens/form_screens/screens/AdmissionForm.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  static const routeName = "/";
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isExpandedProfessorsList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isLargeScreen(context) ||
              ResponsiveWidget.isMediumScreen(context)
          ? PreferredSize(
              child: Card(
                elevation: 4.0,
                child: Container(
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          "Education",
                          style: TextStyle(
                            color: CommonColorConstants.blueLightColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.menu,
                        size: 24.0,
                        color: Colors.black,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.notifications_outlined,
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.mail_outline,
                          size: 24.0,
                        ),
                      ),
                      Padding(
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
                      ),
                      Text(
                        "Amit",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(60.0),
            )
          : ResponsiveWidget.isSmallScreen(context)
              ? PreferredSize(
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              "Education",
                              style: TextStyle(
                                color: CommonColorConstants.blueLightColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.notifications_outlined,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.mail_outline,
                              size: 24.0,
                            ),
                          ),
                          Padding(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              "Amit",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.menu,
                              size: 24.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(60.0),
                )
              : PreferredSize(
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 24.0,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            "Education",
                            style: TextStyle(
                              color: CommonColorConstants.blueLightColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(50.0),
                ),
      body: ResponsiveWidget.isLargeScreen(context) ||
              ResponsiveWidget.isMediumScreen(context)
          ? Stack(
              children: [
                Container(
                  height: double.infinity,
                  color: CommonColorConstants.backgroundColor,
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Professors List",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "All Professors",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      isExpandedProfessorsList =
                                          !isExpandedProfessorsList;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      isExpandedProfessorsList == true
                                          ? Icons.keyboard_arrow_down_outlined
                                          : Icons.keyboard_arrow_up_outlined,
                                    ),
                                  ),
                                ],
                              ),
                              isExpandedProfessorsList == true
                                  ? Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(
                                            thickness: 2.0,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,

                                            // child: ElevatedButton.icon(
                                            //   onPressed: () {
                                            //     Navigator.pushNamed(context,
                                            //         AdmissionForm.routeName);
                                            //   },
                                            //   label: Text("Add New"),
                                            //   icon: Icon(
                                            //     Icons.add,
                                            //   ),
                                            // ),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 6.0,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "Add New",
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 6.0,
                                                    ),
                                                    Icon(
                                                      Icons.add,
                                                      size: 20.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                primary: CommonColorConstants
                                                    .blueLightColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Container(
              color: Colors.white,
            ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, AdmissionForm.routeName);
        },
        icon: Icon(
          Icons.add,
          size: 24.0,
        ),
        label: Text(
          "Admission",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50.0,
            ),
          ),
        ),
      ),
    );
  }
}
