import 'dart:math';
import 'package:animation_demo/api/api_wrapper.dart';
import 'package:animation_demo/screens/form_screens/screens/add_professor_screen.dart';
import 'package:animation_demo/screens/list_screen/widgets/show_details_widget.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_constants.dart';
import '../../../provider_demo/database_provider.dart';
import 'package:animation_demo/model/get_professor_model.dart' as data;

class ListScreen extends StatefulWidget {
  static const routeName = "/";

  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final DataTableSource _data = ProfessorDataTable();
  DatabaseProvider? _databaseProvider;

  @override
  void initState() {
    super.initState();
    if (_databaseProvider == null) {
      _databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      // _databaseProvider!.fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    _databaseProvider!.fetchData();

    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context)
            ? SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Card(
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Professors",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "All Professors",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, AdmissionForm.routeName);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: CommonColorConstants.blueLightColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text(
                                              "Add New",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6.0,
                                            ),
                                            Icon(
                                              Icons.add,
                                              size: 20.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _databaseProvider!.isExpandedListValue();
                                      },
                                      child: Consumer<DatabaseProvider>(
                                        builder: (context, providerValue, child) {
                                          return Icon(
                                            providerValue!.isExpandedList == true ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
                                            size: 32.0,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Divider(
                                  thickness: 6.0,
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Consumer<DatabaseProvider>(
                                  builder: (context, providerValue, child) {
                                    return providerValue!.isExpandedList == true
                                        ? PaginatedDataTable(
                                            source: _data,
                                            columns: const [
                                              DataColumn(
                                                label: Text(
                                                  'ID',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Profile',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Name',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'department',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Gender',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Degree',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Mobile No',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Email',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Joining Date',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Action',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            ],
                                            columnSpacing: 100,
                                            horizontalMargin: 10,
                                            rowsPerPage: 10,
                                            showCheckboxColumn: false,
                                          )
                                        : SizedBox();
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : ResponsiveWidget.isSmallScreen(context)
                ? SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child: Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Professors",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            GridView.count(
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              children: [
                                // GridViewProfessorWidget(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Professors",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AdmissionForm.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: CommonColorConstants.blueLightColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Add New",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Expanded(
                          child: Consumer<DatabaseProvider>(
                            builder: (_, providerValue, child) {
                              return providerValue.isLoading == true
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : providerValue.tempList!.length <= 0
                                      ? Center(
                                          child: Text("No Data Found"),
                                        )
                                      : ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: providerValue.tempList!.length,
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
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Card(
                                                        elevation: 8.0,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(
                                                            50.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          height: 42.0,
                                                          width: 42.0,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: index.isOdd ? CommonColorConstants.blueLightColor : CommonColorConstants.orangeLightColor,
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
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                "${providerValue.tempList![index].firstName} ${providerValue.tempList![index].lastName}",
                                                                style: TextStyle(
                                                                  fontSize: 14.0,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                "lastname",
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
                                                          highlightColor: Colors.transparent,
                                                          splashColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          onPressed: () {
                                                            showDialog(
                                                              barrierDismissible: false,
                                                              context: context,
                                                              builder: (_) {
                                                                return ShowDetailsWidget(
                                                                  listofData: providerValue.tempList!,
                                                                  index: index,
                                                                );
                                                              },
                                                            );
                                                          },
                                                          icon: Icon(
                                                            Icons.visibility,
                                                            size: 20.0,
                                                            color: CommonColorConstants.orangeLightColor,
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
                                                          highlightColor: Colors.transparent,
                                                          splashColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.edit,
                                                            size: 20.0,
                                                            color: CommonColorConstants.blueLightColor,
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
                                                          highlightColor: Colors.transparent,
                                                          splashColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          onPressed: () {
                                                            ApiWrapper.deleteProfessorData(providerValue.tempList![index].id!).then((value) {
                                                              providerValue.fetchData();
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            size: 20.0,
                                                            color: CommonColorConstants.orangeLightColor,
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
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

class ProfessorDataTable extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(200, (index) => {"id": index + 1, "title": "Item $index", "price": Random().nextInt(10000)});

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: CommonColorConstants.blueLightColor,
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
              ),
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: CommonColorConstants.orangeLightColor,
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
              ),
              child: Icon(
                Icons.delete,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
