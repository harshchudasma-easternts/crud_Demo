import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:animation_demo/provider_demo.dart/database_provider.dart';
import 'package:animation_demo/screens/form_screens/screens/AdmissionForm.dart';
import 'package:animation_demo/screens/list_screen/widgets/show_details_widget.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dbhelper/tables/add_professors.dart';

class AllProfessorsList extends StatefulWidget {
  const AllProfessorsList({Key? key}) : super(key: key);

  @override
  State<AllProfessorsList> createState() => _AllProfessorsListState();
}

class _AllProfessorsListState extends State<AllProfessorsList> {
  bool isExpandedProfessorsList = true;

  final dbHelper = DBHelper.instance;
  DatabaseProvider? _databaseProvider;

  @override
  void initState() {
    super.initState();
    if (_databaseProvider == null) {
      _databaseProvider = Provider.of<DatabaseProvider>(context, listen: false)
          .getDatabaseData();
    }
  }

  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      return Expanded(
        child: Card(
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
                        isExpandedProfessorsList = !isExpandedProfessorsList;
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AdmissionForm.routeName);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
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
                                  primary: CommonColorConstants.blueLightColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            _dynamicTableViewWidgetForWebAndDesktop(),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      );
    } else if (ResponsiveWidget.isSmallScreen(context)) {
      return Expanded(
        child: Card(
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
                        isExpandedProfessorsList = !isExpandedProfessorsList;
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AdmissionForm.routeName);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
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
                                  primary: CommonColorConstants.blueLightColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            _dynamicTableViewWidget(),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "All Professors",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AdmissionForm.routeName);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
                  primary: CommonColorConstants.blueLightColor,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: Consumer<DatabaseProvider>(
                builder: (context, providerValue, child) {
                  // providerValue.getDatabaseData();
                  return providerValue.isLoadingValue == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : providerValue.listofData.length <= 0
                          ? Center(
                              child: Text("No Data Found"),
                            )
                          : ListView.builder(
                              itemCount: providerValue.listofData.length,
                              itemBuilder: (context, index) {
                                return IntrinsicHeight(
                                  child: Card(
                                    elevation: 2.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 8.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                50.0,
                                              ),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 42.0,
                                              width: 42.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: index.isOdd
                                                    ? CommonColorConstants
                                                        .blueLightColor
                                                    : CommonColorConstants
                                                        .orangeLightColor,
                                                // image: DecorationImage(
                                                //   fit: BoxFit.fill,
                                                //   image: AssetImage(
                                                //     CommonImageConstats.profileImage,
                                                //   ),
                                                // ),
                                              ),
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16.0,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${providerValue.listofData[index]['FirstName']}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${providerValue.listofData[index]['Department']}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            height: 24.0,
                                            width: 24.0,
                                            child: IconButton(
                                              color: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) {
                                                    return ShowDetailsWidget(
                                                      listofMap: providerValue
                                                          .listofData[index],
                                                    );
                                                  },
                                                );
                                                // dbHelper
                                                //     .delete(
                                                //   listofData[index]['id'],
                                                // )
                                                //     .then(
                                                //   (value) {
                                                //     listofData = value;
                                                //     isLoadingValue = false;
                                                //     setState(() {});
                                                //   },
                                                // );
                                              },
                                              icon: Icon(
                                                Icons.visibility,
                                                size: 20.0,
                                                color: CommonColorConstants
                                                    .orangeLightColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6.0,
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                            width: 24.0,
                                            child: IconButton(
                                              color: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AdmissionForm(
                                                      isEdit: true,
                                                      listOfDynamic:
                                                          providerValue
                                                                  .listofData[
                                                              index],
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                size: 20.0,
                                                color: CommonColorConstants
                                                    .blueLightColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6.0,
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                            width: 24.0,
                                            child: IconButton(
                                              color: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              onPressed: () {
                                                dbHelper
                                                    .delete(
                                                  providerValue
                                                      .listofData[index]['id'],
                                                )
                                                    .then(
                                                  (value) {
                                                    providerValue
                                                        .getDataFromDatabase(
                                                            listofDataValue:
                                                                value);
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                size: 20.0,
                                                color: CommonColorConstants
                                                    .orangeLightColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                },
              ),
              // isLoadingValue == true
              //     ? Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     : listofData.length <= 0
              //         ? Center(
              //             child: Text("No Data Found!"),
              //           )
              //         : ListView.builder(
              //             itemCount: listofData.length,
              //             itemBuilder: (context, index) {
              //               return IntrinsicHeight(
              //                 child: Card(
              //                   elevation: 2.0,
              //                   child: Container(
              //                     padding: EdgeInsets.symmetric(
              //                       horizontal: 16.0,
              //                       vertical: 8.0,
              //                     ),
              //                     child: Row(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         Card(
              //                           elevation: 8.0,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.circular(
              //                               50.0,
              //                             ),
              //                           ),
              //                           child: Container(
              //                             alignment: Alignment.center,
              //                             height: 42.0,
              //                             width: 42.0,
              //                             decoration: BoxDecoration(
              //                               shape: BoxShape.circle,
              //                               color: index.isOdd
              //                                   ? CommonColorConstants
              //                                       .blueLightColor
              //                                   : CommonColorConstants
              //                                       .orangeLightColor,
              //                               // image: DecorationImage(
              //                               //   fit: BoxFit.fill,
              //                               //   image: AssetImage(
              //                               //     CommonImageConstats.profileImage,
              //                               //   ),
              //                               // ),
              //                             ),
              //                             child: Text(
              //                               "${index + 1}",
              //                               style: TextStyle(
              //                                 fontSize: 16.0,
              //                                 color: Colors.white,
              //                                 fontWeight: FontWeight.bold,
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           width: 16.0,
              //                         ),
              //                         Expanded(
              //                           child: Container(
              //                             child: Column(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceEvenly,
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(
              //                                   "${listofData[index]['FirstName']}",
              //                                   style: TextStyle(
              //                                     fontSize: 14.0,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                                 Text(
              //                                   "${listofData[index]['Department']}",
              //                                   style: TextStyle(
              //                                     fontSize: 14.0,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ),
              //                         Spacer(),
              //                         SizedBox(
              //                           height: 24.0,
              //                           width: 24.0,
              //                           child: IconButton(
              //                             color: Colors.transparent,
              //                             focusColor: Colors.transparent,
              //                             highlightColor: Colors.transparent,
              //                             splashColor: Colors.transparent,
              //                             hoverColor: Colors.transparent,
              //                             onPressed: () {
              //                               showDialog(
              //                                 context: context,
              //                                 barrierDismissible: false,
              //                                 builder: (context) {
              //                                   return ShowDetailsWidget(
              //                                     listofMap: listofData[index],
              //                                   );
              //                                 },
              //                               );
              //                               // dbHelper
              //                               //     .delete(
              //                               //   listofData[index]['id'],
              //                               // )
              //                               //     .then(
              //                               //   (value) {
              //                               //     listofData = value;
              //                               //     isLoadingValue = false;
              //                               //     setState(() {});
              //                               //   },
              //                               // );
              //                             },
              //                             icon: Icon(
              //                               Icons.visibility,
              //                               size: 20.0,
              //                               color: CommonColorConstants
              //                                   .orangeLightColor,
              //                             ),
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           width: 6.0,
              //                         ),
              //                         SizedBox(
              //                           height: 24.0,
              //                           width: 24.0,
              //                           child: IconButton(
              //                             color: Colors.transparent,
              //                             focusColor: Colors.transparent,
              //                             highlightColor: Colors.transparent,
              //                             splashColor: Colors.transparent,
              //                             hoverColor: Colors.transparent,
              //                             onPressed: () {
              //                               Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       AdmissionForm(
              //                                     isEdit: true,
              //                                     listOfDynamic:
              //                                         listofData[index],
              //                                   ),
              //                                 ),
              //                               );
              //                             },
              //                             icon: Icon(
              //                               Icons.edit,
              //                               size: 20.0,
              //                               color: CommonColorConstants
              //                                   .blueLightColor,
              //                             ),
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           width: 6.0,
              //                         ),
              //                         SizedBox(
              //                           height: 24.0,
              //                           width: 24.0,
              //                           child: IconButton(
              //                             color: Colors.transparent,
              //                             focusColor: Colors.transparent,
              //                             highlightColor: Colors.transparent,
              //                             splashColor: Colors.transparent,
              //                             hoverColor: Colors.transparent,
              //                             onPressed: () {
              //                               dbHelper
              //                                   .delete(
              //                                 listofData[index]['id'],
              //                               )
              //                                   .then(
              //                                 (value) {
              //                                   listofData = value;
              //                                   isLoadingValue = false;
              //                                   setState(() {});
              //                                 },
              //                               );
              //                             },
              //                             icon: Icon(
              //                               Icons.delete,
              //                               size: 20.0,
              //                               color: CommonColorConstants
              //                                   .orangeLightColor,
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //           ),
            ),
          ],
        ),
      );
    }
  }

  Widget _dynamicTableViewWidget() {
    List<Widget> tableRowList = [
      Divider(
        thickness: 1,
        height: 1,
        color: Colors.grey,
      ),
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  "No.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Department',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Degree',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Joining Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Action',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1,
        height: 1,
        color: Colors.grey,
      ),
    ];

    Widget tbl = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: tableRowList,
    );
    return tbl;
  }

  Widget _dynamicTableViewWidgetForWebAndDesktop() {
    List<Widget> tableRowList = [
      Divider(
        thickness: 1,
        height: 1,
        color: Colors.grey,
      ),
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  "No.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Department',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Degree',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Joining Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Action',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1,
        height: 1,
        color: Colors.grey,
      ),
    ];

    Widget tbl = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: tableRowList,
    );
    return tbl;
  }
}
