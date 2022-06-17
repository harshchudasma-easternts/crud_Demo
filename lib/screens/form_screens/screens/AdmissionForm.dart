import 'dart:io';
import 'dart:typed_data';

import 'package:animation_demo/common_widgets/custom_textfield_widget.dart';
import 'package:animation_demo/common_widgets/header_navbar_widget.dart';
import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:animation_demo/dbhelper/tables/add_professors.dart';
import 'package:animation_demo/utils/permission_utils.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class AdmissionForm extends StatefulWidget {
  static const routeName = "/admissionForm";

  const AdmissionForm({Key? key}) : super(key: key);

  @override
  State<AdmissionForm> createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  DateTime currentDate = DateTime.now();
  String formattedDate = DateFormat('dd-mm-yyyy').format(DateTime.now());

  bool password = true;
  bool confirmPassword = true;

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

  final picker = ImagePicker();
  late String filePath;
  late String fileName;
  Uint8List webImage = Uint8List(0);

  String? selectedCourse;
  String? selectedDepartment;
  String? selectedGender;

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
  late final TextEditingController _mobileNoTextEditingController =
      TextEditingController();
  late final TextEditingController _addressTextEditingController =
      TextEditingController();
  late final TextEditingController _educationTextEditingController =
      TextEditingController();

  late final _firstNameFocusNode = FocusNode();
  late final _lastNameFocusNode = FocusNode();
  late final _emailFocusNode = FocusNode();
  late final _joiningDateFocusNode = FocusNode();
  late final _passwordFocusNode = FocusNode();
  late final _confirmPasswordFocusNode = FocusNode();
  late final _designationFocusNode = FocusNode();
  late final _departmentFocusNode = FocusNode();
  late final _genderFocusNode = FocusNode();
  late final _mobileNoFocusNode = FocusNode();
  late final _addressFocusNode = FocusNode();
  late final _educationFocusNode = FocusNode();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper.instance;
    _textFieldFocusNode();
  }

  Future<void> insertData({
    required String firstName,
    required String lastName,
    required String email,
    String? joiningDate,
    required String password,
    required String confirmPassword,
    required String designation,
    required String department,
    required String gender,
    required String mobileNo,
    String? address,
    // required String imagebase64String,
    required String education,
  }) async {
    Map<String, dynamic> insertRow = {
      DBHelper.firstName: firstName,
      DBHelper.lastName: lastName,
      DBHelper.emailAddress: email,
      DBHelper.joiningDate: joiningDate ?? DateTime.now(),
      DBHelper.password: password,
      DBHelper.confirmPassword: confirmPassword,
      DBHelper.designation: designation,
      DBHelper.department: department,
      DBHelper.gender: gender,
      DBHelper.mobileNo: mobileNo,
      DBHelper.address: address ?? "-",
      // DBHelper.imageFile: imagebase64String,
      DBHelper.education: education,
    };
    final id = await dbHelper.insert(insertRow);

    print("insert database value ${id}");
  }

  void _textFieldFocusNode() {
    _firstNameFocusNode.addListener(() {
      setState(() {});
    });
    _lastNameFocusNode.addListener(() {
      setState(() {});
    });
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _joiningDateFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _confirmPasswordFocusNode.addListener(() {
      setState(() {});
    });
    _designationFocusNode.addListener(() {
      setState(() {});
    });
    _departmentFocusNode.addListener(() {
      setState(() {});
    });
    _genderFocusNode.addListener(() {
      setState(() {});
    });
    _mobileNoFocusNode.addListener(() {
      setState(() {});
    });
    _addressFocusNode.addListener(() {
      setState(() {});
    });
    _educationFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TargetPlatform platform = Theme.of(context).platform;
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
                                      child: CustomTextFieldWidget(
                                        controller:
                                            _firstNameTextEditingController,
                                        textfiledFocusNode: _firstNameFocusNode,
                                        textFieldLableName: "FirstName",
                                        maximumLengthOfField: 20,
                                        textFieldCounterText: "",
                                        textformFieldValidator:
                                            (firstNameValue) {
                                          if (firstNameValue!.isEmpty) {
                                            return "Please enter the firstname";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: CustomTextFieldWidget(
                                        controller:
                                            _lastNameTextEditingController,
                                        textfiledFocusNode: _lastNameFocusNode,
                                        textFieldLableName: "LastName",
                                        maximumLengthOfField: 20,
                                        textFieldCounterText: "",
                                        textformFieldValidator:
                                            (lastNameValue) {
                                          if (lastNameValue!.isEmpty) {
                                            return "Please enter the lastname";
                                          }
                                          return null;
                                        },
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
                                      child: CustomTextFieldWidget(
                                        controller: _emailTextEditingController,
                                        textfiledFocusNode: _emailFocusNode,
                                        textFieldLableName: "Email",
                                        textformFieldValidator:
                                            (String? email) {
                                          if (email!.isEmpty) {
                                            return "Please enter the email";
                                          } else if (!EmailValidator.validate(
                                              email!)) {
                                            return "Please enter the valid email";
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
                                            _joiningDateTextEditingController,
                                        cursorColor:
                                            CommonColorConstants.blueLightColor,
                                        focusNode: _joiningDateFocusNode,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          labelText: "Joining Date",
                                          labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                _joiningDateFocusNode.hasFocus
                                                    ? CommonColorConstants
                                                        .blueLightColor
                                                    : Colors.grey,
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: CommonColorConstants
                                                  .blueLightColor,
                                            ),
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
                                      child: CustomTextFieldWidget(
                                        obsecureText: password,
                                        controller:
                                            _passwordTextEditingController,
                                        textfiledFocusNode: _passwordFocusNode,
                                        textFieldLableName: "Password",
                                        maximumLengthOfField: 15,
                                        textFieldCounterText: "",
                                        textFieldMaximumLines: 1,
                                        suffixIconWidget: GestureDetector(
                                          onTap: () {
                                            password = !password;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            password
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: _passwordFocusNode.hasFocus
                                                ? CommonColorConstants
                                                    .blueLightColor
                                                : Colors.grey,
                                          ),
                                        ),
                                        textformFieldValidator: (passValue) {
                                          if (passValue!.isEmpty) {
                                            return "password is empty";
                                          } else if (passValue!.length < 8 ||
                                              passValue!.length > 15) {
                                            return "password must be minimum 8 and maximum 15 character required";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: CustomTextFieldWidget(
                                        obsecureText: confirmPassword,
                                        controller:
                                            _confirmTextEditingController,
                                        textfiledFocusNode:
                                            _confirmPasswordFocusNode,
                                        textFieldMaximumLines: 1,
                                        textFieldLableName: "Confirm Password",
                                        textformFieldValidator:
                                            (confirmPassValue) {
                                          if (confirmPassValue!.isEmpty) {
                                            return "confirm password is empty";
                                          } else if (confirmPassValue!.length <
                                                  8 ||
                                              confirmPassValue!.length > 15) {
                                            return "password must be minimum 8 and maximum 15 character required";
                                          } else if (confirmPassValue !=
                                              _passwordTextEditingController
                                                  .text) {
                                            return "password must be same as above";
                                          }
                                          return null;
                                        },
                                        suffixIconWidget: GestureDetector(
                                          onTap: () {
                                            confirmPassword = !confirmPassword;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            confirmPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color:
                                                _confirmPasswordFocusNode
                                                        .hasFocus
                                                    ? CommonColorConstants
                                                        .blueLightColor
                                                    : Colors.grey,
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
                                      child: CustomTextFieldWidget(
                                        controller:
                                            _designationTExtEdtitingcontroller,
                                        textfiledFocusNode:
                                            _designationFocusNode,
                                        textFieldLableName: "Designation",
                                        textformFieldValidator:
                                            (designationValue) {
                                          if (designationValue!.isEmpty) {
                                            return "Please enter the designation";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          icon: Icon(Icons
                                              .keyboard_arrow_down_outlined),
                                          isExpanded: true,
                                          focusNode: _departmentFocusNode,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.0),
                                            labelText: "Department",
                                            labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color:
                                                  _departmentFocusNode.hasFocus
                                                      ? CommonColorConstants
                                                          .blueLightColor
                                                      : Colors.grey,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: CommonColorConstants
                                                    .blueLightColor,
                                              ),
                                            ),
                                          ),
                                          validator: (departmentValue) {
                                            if (departmentValue == null) {
                                              return "Please select the department";
                                            }
                                            return null;
                                          },
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
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
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
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          focusNode: _genderFocusNode,
                                          icon: Icon(Icons
                                              .keyboard_arrow_down_outlined),
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.0),
                                            labelText: "Gender",
                                            labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: _genderFocusNode.hasFocus
                                                  ? CommonColorConstants
                                                      .blueLightColor
                                                  : Colors.grey,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: CommonColorConstants
                                                    .blueLightColor,
                                              ),
                                            ),
                                          ),
                                          validator: (genderValue) {
                                            if (genderValue == null) {
                                              return "Please select the gender";
                                            }
                                            return null;
                                          },
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
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Expanded(
                                      child: CustomTextFieldWidget(
                                        controller:
                                            _mobileNoTextEditingController,
                                        textfiledFocusNode: _mobileNoFocusNode,
                                        textFieldLableName: "Mobile No.",
                                        textFieldInputFormater: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        maximumLengthOfField: 15,
                                        textFieldCounterText: "",
                                        textformFieldValidator: (value) {
                                          String patttern =
                                              r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                          RegExp regExp = new RegExp(patttern);
                                          if (value!.length == 0) {
                                            return 'Please enter mobile number';
                                          } else if (!regExp.hasMatch(value)) {
                                            return 'Please enter valid mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  controller: _addressTextEditingController,
                                  textfiledFocusNode: _addressFocusNode,
                                  textFieldLableName: "Address",
                                  textFieldMaximumLines: 4,
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                webImage.isNotEmpty
                                    ? Container(
                                        height: 50.0,
                                        child: Image.memory(webImage),
                                      )
                                    : Column(
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
                                              onTap: () {
                                                PermissionUtil.checkPermission(
                                                        platform)
                                                    .then((isGranted) async {
                                                  if (isGranted) {
                                                    print(
                                                        "Image related filename and filepath is tapped");
                                                    _selectImageFromGallary();
                                                  } else {
                                                    print(
                                                        'perimssion nont granted...........');
                                                  }
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 100.0,
                                                color: Colors.white,
                                                child: Text(
                                                  "Upload your File or Image",
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
                                CustomTextFieldWidget(
                                  controller: _educationTextEditingController,
                                  textfiledFocusNode: _educationFocusNode,
                                  textFieldLableName: "Education",
                                  textFieldMaximumLines: 4,
                                  textformFieldValidator: (educationValue) {
                                    if (educationValue!.isEmpty) {
                                      return "Please enter the Education Details";
                                    }
                                    return null;
                                  },
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
                                CustomTextFieldWidget(
                                  controller: _firstNameTextEditingController,
                                  textfiledFocusNode: _firstNameFocusNode,
                                  textFieldLableName: "FirstName",
                                  maximumLengthOfField: 20,
                                  textFieldCounterText: "",
                                  textformFieldValidator: (firstNameValue) {
                                    if (firstNameValue!.isEmpty) {
                                      return "Please enter the firstname";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  controller: _lastNameTextEditingController,
                                  textfiledFocusNode: _lastNameFocusNode,
                                  textFieldLableName: "LastName",
                                  maximumLengthOfField: 20,
                                  textFieldCounterText: "",
                                  textformFieldValidator: (lastNameValue) {
                                    if (lastNameValue!.isEmpty) {
                                      return "Please enter the lastname";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  controller: _emailTextEditingController,
                                  textfiledFocusNode: _emailFocusNode,
                                  textFieldLableName: "Email",
                                  textformFieldValidator: (String? email) {
                                    if (email!.isEmpty) {
                                      return "Please enter the email";
                                    } else if (!EmailValidator.validate(
                                        email!)) {
                                      return "Please enter the valid email";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: _joiningDateTextEditingController,
                                  cursorColor:
                                      CommonColorConstants.blueLightColor,
                                  focusNode: _joiningDateFocusNode,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    labelText: "Joining Date",
                                    labelStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: _joiningDateFocusNode.hasFocus
                                          ? CommonColorConstants.blueLightColor
                                          : Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CommonColorConstants.blueLightColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  obsecureText: password,
                                  controller: _passwordTextEditingController,
                                  textfiledFocusNode: _passwordFocusNode,
                                  textFieldLableName: "Password",
                                  maximumLengthOfField: 15,
                                  textFieldCounterText: "",
                                  textFieldMaximumLines: 1,
                                  suffixIconWidget: GestureDetector(
                                    onTap: () {
                                      password = !password;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      password
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: _passwordFocusNode.hasFocus
                                          ? CommonColorConstants.blueLightColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  textformFieldValidator: (passValue) {
                                    if (passValue!.isEmpty) {
                                      return "password is empty";
                                    } else if (passValue!.length < 8 ||
                                        passValue!.length > 15) {
                                      return "password must be minimum 8 and maximum 15 character required";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  obsecureText: confirmPassword,
                                  controller: _confirmTextEditingController,
                                  textfiledFocusNode: _confirmPasswordFocusNode,
                                  textFieldMaximumLines: 1,
                                  textFieldLableName: "Confirm Password",
                                  textformFieldValidator: (confirmPassValue) {
                                    if (confirmPassValue!.isEmpty) {
                                      return "confirm password is empty";
                                    } else if (confirmPassValue!.length < 8 ||
                                        confirmPassValue!.length > 15) {
                                      return "password must be minimum 8 and maximum 15 character required";
                                    } else if (confirmPassValue !=
                                        _passwordTextEditingController.text) {
                                      return "password must be same as above";
                                    }
                                    return null;
                                  },
                                  suffixIconWidget: GestureDetector(
                                    onTap: () {
                                      confirmPassword = !confirmPassword;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      confirmPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: _confirmPasswordFocusNode.hasFocus
                                          ? CommonColorConstants.blueLightColor
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  controller:
                                      _designationTExtEdtitingcontroller,
                                  textfiledFocusNode: _designationFocusNode,
                                  textFieldLableName: "Designation",
                                  textformFieldValidator: (designationValue) {
                                    if (designationValue!.isEmpty) {
                                      return "Please enter the designation";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    isExpanded: true,
                                    focusNode: _departmentFocusNode,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0.0),
                                      labelText: "Department",
                                      labelStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: _departmentFocusNode.hasFocus
                                            ? CommonColorConstants
                                                .blueLightColor
                                            : Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                    validator: (departmentValue) {
                                      if (departmentValue == null) {
                                        return "Please select the department";
                                      }
                                      return null;
                                    },
                                    items: departmentList
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    customItemsHeight: 4,
                                    value: selectedDepartment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedDepartment = value as String;
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
                                const SizedBox(
                                  height: 24.0,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2(
                                    focusNode: _genderFocusNode,
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0.0),
                                      labelText: "Gender",
                                      labelStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: _genderFocusNode.hasFocus
                                            ? CommonColorConstants
                                                .blueLightColor
                                            : Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CommonColorConstants
                                              .blueLightColor,
                                        ),
                                      ),
                                    ),
                                    validator: (genderValue) {
                                      if (genderValue == null) {
                                        return "Please select the gender";
                                      }
                                      return null;
                                    },
                                    hint: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    items: genderList
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
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
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  controller: _mobileNoTextEditingController,
                                  textfiledFocusNode: _mobileNoFocusNode,
                                  textFieldLableName: "Mobile No.",
                                  textFieldInputFormater: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  maximumLengthOfField: 15,
                                  textFieldCounterText: "",
                                  textformFieldValidator: (value) {
                                    String patttern =
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                    RegExp regExp = new RegExp(patttern);
                                    if (value!.length == 0) {
                                      return 'Please enter mobile number';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter valid mobile number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                CustomTextFieldWidget(
                                  controller: _addressTextEditingController,
                                  textfiledFocusNode: _addressFocusNode,
                                  textFieldLableName: "Address",
                                  textFieldMaximumLines: 4,
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
                                        onTap: () {
                                          PermissionUtil.checkPermission(
                                                  platform)
                                              .then(
                                            (isGranted) async {
                                              if (isGranted) {
                                                print(
                                                    "Image related filename and filepath is tapped");
                                                _selectImageFromGallary();
                                              } else {
                                                print(
                                                    'perimssion nont granted...........');
                                              }
                                            },
                                          );
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 100.0,
                                          color: Colors.white,
                                          child: Text(
                                            "Upload your File or Image",
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
                                CustomTextFieldWidget(
                                  controller: _educationTextEditingController,
                                  textfiledFocusNode: _educationFocusNode,
                                  textFieldLableName: "Education",
                                  textFieldMaximumLines: 4,
                                  textformFieldValidator: (educationValue) {
                                    if (educationValue!.isEmpty) {
                                      return "Please enter the Education Details";
                                    }
                                    return null;
                                  },
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
                                        print(
                                            "a;; the details for here ${_firstNameTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_lastNameTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_emailTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_joiningDateTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_passwordTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_confirmTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_designationTExtEdtitingcontroller.text}");
                                        print(
                                            "a;; the details for here ${_mobileNoTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_addressTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${_educationTextEditingController.text}");
                                        print(
                                            "a;; the details for here ${selectedDepartment}");
                                        print(
                                            "a;; the details for here ${selectedGender}");
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          // _formValidation();
                                          insertData(
                                            firstName:
                                                _firstNameTextEditingController
                                                    .text,
                                            lastName:
                                                _lastNameTextEditingController
                                                    .text,
                                            email: _emailTextEditingController
                                                .text,
                                            joiningDate:
                                                _joiningDateTextEditingController
                                                    .text,
                                            password:
                                                _passwordTextEditingController
                                                    .text,
                                            confirmPassword:
                                                _confirmTextEditingController
                                                    .text,
                                            designation:
                                                _designationTExtEdtitingcontroller
                                                    .text,
                                            department: selectedDepartment!,
                                            gender: selectedGender!,
                                            mobileNo:
                                                _mobileNoTextEditingController
                                                    .text,
                                            address:
                                                _addressTextEditingController
                                                    .text,
                                            education:
                                                _educationTextEditingController
                                                    .text,
                                          ).then((value) {
                                            Navigator.of(context).pop();
                                          });
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

  @override
  void dispose() {
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _addressTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _joiningDateTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmTextEditingController.dispose();
    _mobileNoTextEditingController.dispose();
    _designationTExtEdtitingcontroller.dispose();
    _educationTextEditingController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _joiningDateFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _addressFocusNode.dispose();
    _designationFocusNode.dispose();
    _departmentFocusNode.dispose();
    _educationFocusNode.dispose();
    _genderFocusNode.dispose();
    _mobileNoFocusNode.dispose();
    super.dispose();
  }

  void _selectImageFromGallary() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    File image = File(pickedFile!.path);
    filePath = image.path;
    fileName = path.basename(image.path);
    print("${fileName},${filePath}");
    setState(() {});
    // if(!kIsWeb){
    //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //   File image = File(pickedFile!.path);
    //   filePath = image.path;
    //   fileName = path.basename(image.path);
    //   setState(() {});
    // }else{
    //   print("this is web");
    //   final ImagePicker _picker = ImagePicker();
    //   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //   if (image != null) {
    //     var f = await image.readAsBytes();
    //     setState(() {
    //       webImage = f;
    //     });
    //   }
    // }
  }
}
