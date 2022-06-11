import 'package:animation_demo/common_widgets/header_navbar_widget.dart';
import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:dotted_border/dotted_border.dart';
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final departmentList = [
    "Computer",
    "Mechanical",
    "Mathermatics",
    "Commerce",
  ];
  final genderList = [
    "Male",
    "Female",
  ];
  String? selectedCourse;
  String? selectedDepartment;
  String? selectedGender;
  List<String> hobbiesList = [];
  late final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  late final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  late final TextEditingController _emailTextEditingController =
      TextEditingController();
  late final TextEditingController _joiningDateTextEditingController =
      TextEditingController();
  late final TextEditingController _passwordTextEditingController =
      TextEditingController();
  late final TextEditingController _confirmTextEditingController =
      TextEditingController();
  late final TextEditingController _designationTExtEdtitingcontroller =
      TextEditingController();
  late final TextEditingController _departmentTextEditingController =
      TextEditingController();
  late final TextEditingController _genderTextEditingController =
      TextEditingController();
  late final TextEditingController _mobileNoTextEditingController =
      TextEditingController();
  late final TextEditingController _addressTextEditingController =
      TextEditingController();
  late final TextEditingController _educationTextEditingController =
      TextEditingController();

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
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add Professors",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
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
                                Text(
                                  "Basic Information",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _firstNameTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "FirstName",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "value is Empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _lastNameTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "LastName",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _emailTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Email",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _joiningDateTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Joining Date",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _passwordTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _confirmTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Confirm Password",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _designationTExtEdtitingcontroller,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Designation",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.0,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 3.0,
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            icon: Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            isExpanded: true,
                                            hint: Text(
                                              'Department',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            items: departmentList
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ))
                                                .toList(),
                                            customItemsHeight: 4,
                                            value: selectedDepartment,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  selectedDepartment =
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
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.0,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 3.0,
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            icon: Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            isExpanded: true,
                                            hint: Text(
                                              'Gender',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            items: genderList
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ))
                                                .toList(),
                                            customItemsHeight: 4,
                                            value: selectedGender,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  selectedGender =
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
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _mobileNoTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Mobile No.",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _addressTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    hintText: "Address",
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "UploadPhoto",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    DottedBorder(
                                      color: Colors.black,
                                      strokeWidth: 1,
                                      dashPattern: [10, 6],
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 100.0,
                                          color: Colors.white,
                                          child: Text(
                                            "Drop File Here to Upload",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _educationTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    hintText: "Education",
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
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
                                        primary: CommonColorConstants
                                            .orangeLightColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          // _formValidation();
                                        }
                                      },
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
                                        primary:
                                            CommonColorConstants.blueLightColor,
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
              )
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(
                        //   height: 320.0,
                        //   decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //       begin: Alignment.topRight,
                        //       end: Alignment.bottomLeft,
                        //       stops: const [
                        //         0.1,
                        //         0.4,
                        //         0.6,
                        //         0.9,
                        //       ],
                        //       colors: [
                        //         CommonColorConstants.dark_blue_70,
                        //         CommonColorConstants.dark_blue_65,
                        //         CommonColorConstants.dark_blue_60,
                        //         CommonColorConstants.dark_blue_58,
                        //       ],
                        //     ),
                        //   ),
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         height: double.infinity,
                        //         width: double.infinity,
                        //         child: CustomPaint(
                        //           painter: CurvePainter(),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Professors",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700,
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
                                Text(
                                  "Basic Information",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _firstNameTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "FirstName",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _lastNameTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "LastName",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _emailTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Joining Date",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _passwordTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _confirmTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller:
                                      _designationTExtEdtitingcontroller,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Designation",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 3.0,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      isExpanded: true,
                                      hint: Text(
                                        'Department',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      items: departmentList
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
                                      value: selectedDepartment,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            selectedDepartment =
                                                value as String;
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
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 3.0,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      isExpanded: true,
                                      hint: Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      items: genderList
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
                                      value: selectedGender,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            selectedGender = value as String;
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
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _mobileNoTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Mobile No.",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _addressTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    hintText: "Address",
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "UploadPhoto",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    DottedBorder(
                                      color: Colors.black,
                                      strokeWidth: 1,
                                      dashPattern: [10, 6],
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 100.0,
                                          color: Colors.white,
                                          child: Text(
                                            "Drop File Here to Upload",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _educationTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    hintText: "Education",
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
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
                                        primary: CommonColorConstants
                                            .orangeLightColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          // _formValidation();
                                        }
                                      },
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
                                        primary:
                                            CommonColorConstants.blueLightColor,
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
      ),
    );
  }

  // void _formValidation() {
  //   if(_firstNameTextEditingController.text.isEmpty){
  //     print("Hello ");
  //   }
  // }
}
