import 'package:animation_demo/common_widgets/header_navbar_widget.dart';
import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdmissionForm extends StatefulWidget {
  static const routeName = "/admissionForm";
  const AdmissionForm({Key? key}) : super(key: key);

  @override
  State<AdmissionForm> createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  DateTime currentDate = DateTime.now();
  String formattedDate = DateFormat('dd-mm-yyyy').format(DateTime.now());
  String genderValue = "";
  final courseList = [
    "BCA",
    "B.Com",
    "BBA",
    "BBA Honrs",
    "MCA",
    "M.Com",
    "MBA",
    "IMBA"
  ];
  String? selectedCourse;
  String ImageFileName = "";
  List<String> hobbiesList = [];
  late TextEditingController _hobbiesTextEditingController =
      TextEditingController();
  bool isAddHobbiesVisible = false;

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
        body: ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context)
            ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(28.0),
                  color: Colors.grey.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Admission",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: CommonColorConstants.tealColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Icon(
                              Icons.mail,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: CommonColorConstants.tealColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "FirstName",
                                        hintText: "FirstName",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "LastName",
                                        hintText: "LastName",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "Email",
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "Joining Date",
                                        hintText: "Jining Date",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "Password",
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "Confirm Password",
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          CommonColorConstants.blueLightColor,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 6.0),
                                        labelText: "Designation",
                                        hintText: "Designation",
                                        hintStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "Department",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "*",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4.0,
                                            horizontal: 12.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.8,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              isExpanded: true,
                                              hint: Text(
                                                'Department',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                              items: courseList
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ))
                                                  .toList(),
                                              customItemsHeight: 4,
                                              value: selectedCourse,
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    selectedCourse =
                                                        value as String;
                                                  },
                                                );
                                              },
                                              buttonHeight: 40,
                                              buttonWidth: 140,
                                              itemHeight: 40,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hobbies",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          isAddHobbiesVisible = true;
                                          setState(() {});
                                        },
                                        child: Text(
                                          "Add Hobbies",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                CommonColorConstants.tealColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              isAddHobbiesVisible == false
                                  ? SizedBox()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.8,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: TextField(
                                            controller:
                                                _hobbiesTextEditingController,
                                            autofocus: false,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              hintText: "Add Hobby",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  isAddHobbiesVisible = false;
                                                  _hobbiesTextEditingController
                                                      .text = "";
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    color: CommonColorConstants
                                                        .tealColor,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12.0,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (_hobbiesTextEditingController
                                                      .text.isNotEmpty) {
                                                    print(
                                                        "textfield Controller value ${_hobbiesTextEditingController.text}");
                                                    for (int v = 0;
                                                        v <= 10;
                                                        v++) {
                                                      hobbiesList.add(
                                                          _hobbiesTextEditingController
                                                              .text);
                                                    }
                                                    isAddHobbiesVisible = false;
                                                    setState(() {});
                                                    print(
                                                        "textfield Controller value ${hobbiesList.length}");
                                                  }
                                                  _hobbiesTextEditingController
                                                      .text = "";
                                                },
                                                child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                    color: CommonColorConstants
                                                        .tealColor,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              hobbiesList.isEmpty
                                  ? SizedBox()
                                  : Container(
                                      height: 32.0,
                                      margin: EdgeInsets.only(bottom: 12.0),
                                      child: ListView.builder(
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: hobbiesList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4.0,
                                              horizontal: 12.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CommonColorConstants
                                                  .tealColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                50.0,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${hobbiesList[index]}",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 6.0,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    hobbiesList.removeAt(index);
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Gender",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Radio(
                                    activeColor: CommonColorConstants.tealColor,
                                    value: "Male",
                                    groupValue: genderValue,
                                    onChanged: (String? value) {
                                      setState(
                                        () {
                                          genderValue = value!;
                                        },
                                      );
                                      print(
                                          "gender related value $genderValue");
                                    },
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Radio(
                                    activeColor: CommonColorConstants.tealColor,
                                    value: "Female",
                                    groupValue: genderValue,
                                    onChanged: (String? value) {
                                      setState(
                                        () {
                                          genderValue = value!;
                                        },
                                      );
                                      print(
                                          "gender related value $genderValue");
                                    },
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        hintText: "Address",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 8.0),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              Text(
                                "Parent's Details",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text: "Father's Name",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "*",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.8,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: TextFormField(
                                            autofocus: false,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              hintText: "Father's Name",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text: "Occupation",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "*",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.8,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: TextFormField(
                                            autofocus: false,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              hintText: "Occupation",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Mother's Name",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.8,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: TextFormField(
                                            autofocus: false,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              hintText: "Mother's Name",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Occupation",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.8,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: TextFormField(
                                            autofocus: false,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              hintText: "Occupation",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 6.0),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: CommonColorConstants.tealColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 6.0),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: CommonColorConstants.tealColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.grey.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "New Admission",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: CommonColorConstants.tealColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Icon(
                              Icons.mail,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: CommonColorConstants.tealColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "FirstName",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "FirstName",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "MiddleName",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "MiddleName",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "LastName",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "LastName",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Mobile No",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Mobile No",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Email",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Date of Birth",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14.0,
                                        horizontal: 12.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.8,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          6.0,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "$formattedDate",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Select Course",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.0,
                                      horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Course',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        items: courseList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        customItemsHeight: 4,
                                        value: selectedCourse,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              selectedCourse = value as String;
                                            },
                                          );
                                        },
                                        buttonHeight: 40,
                                        buttonWidth: 140,
                                        itemHeight: 40,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "State",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "State",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "City",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "City",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hobbies",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return _addHobbiesDialog();
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Add Hobbies",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                CommonColorConstants.tealColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              hobbiesList.isEmpty
                                  ? SizedBox()
                                  : Container(
                                      height: 32.0,
                                      margin: EdgeInsets.only(bottom: 12.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: hobbiesList.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4.0,
                                              horizontal: 12.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CommonColorConstants
                                                  .tealColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                50.0,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${hobbiesList[index]}",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 6.0,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    hobbiesList.removeAt(index);
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Gender",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Radio(
                                    activeColor: CommonColorConstants.tealColor,
                                    value: "Male",
                                    groupValue: genderValue,
                                    onChanged: (String? value) {
                                      setState(
                                        () {
                                          genderValue = value!;
                                        },
                                      );
                                      print(
                                          "gender related value $genderValue");
                                    },
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Radio(
                                    activeColor: CommonColorConstants.tealColor,
                                    value: "Female",
                                    groupValue: genderValue,
                                    onChanged: (String? value) {
                                      setState(
                                        () {
                                          genderValue = value!;
                                        },
                                      );
                                      print(
                                          "gender related value $genderValue");
                                    },
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        hintText: "Address",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 8.0),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Parent's Details",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Father's Name",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Father's Name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Occupation",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Occupation",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Mother's Name",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Mother's Name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Occupation",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        6.0,
                                      ),
                                    ),
                                    child: TextFormField(
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Occupation",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: CommonColorConstants.tealColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: CommonColorConstants.tealColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _addHobbiesDialog() {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(
            12.0,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Hobby",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _hobbiesTextEditingController.text = "";
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.8,
                  ),
                  borderRadius: BorderRadius.circular(
                    6.0,
                  ),
                ),
                child: TextField(
                  controller: _hobbiesTextEditingController,
                  autofocus: false,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Add Hobby",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (_hobbiesTextEditingController.text.isNotEmpty) {
                      print(
                          "textfield Controller value ${_hobbiesTextEditingController.text}");
                      for (int v = 0; v <= 10; v++) {
                        hobbiesList.add(_hobbiesTextEditingController.text);
                      }
                      setState(() {});
                      print("textfield Controller value ${hobbiesList.length}");
                      Navigator.pop(context);
                    }
                    _hobbiesTextEditingController.text = "";
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: CommonColorConstants.tealColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
