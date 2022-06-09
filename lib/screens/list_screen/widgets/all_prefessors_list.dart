import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/screens/form_screens/screens/AdmissionForm.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class AllProfessorsList extends StatefulWidget {
  const AllProfessorsList({Key? key}) : super(key: key);

  @override
  State<AllProfessorsList> createState() => _AllProfessorsListState();
}

class _AllProfessorsListState extends State<AllProfessorsList> {
  bool isExpandedProfessorsList = true;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      return Column(
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
                      _dynamicTableViewWidget(),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "All Professors",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            thickness: 2.0,
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
          Container(
            child: new GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (9 / 3),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(
                    
                  ),
                ),
              ],
            ),
          ),
        ],
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
}
