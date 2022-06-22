import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:flutter/material.dart';

class ShowDetailsWidget extends StatelessWidget {
  Map<String, dynamic>? listofMap;
  ShowDetailsWidget({Key? key, this.listofMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  shadowColor: CommonColorConstants.blueLightColor,
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // image: DecorationImage(
                      //   fit: BoxFit.contain,
                      //   image: AssetImage(
                      //     CommonImageConstats.profileImage,
                      //   ),
                      // ),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 42.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${listofMap!['FirstName']} ${listofMap!['LastName']}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${listofMap!['Designation']}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${listofMap!['EmailAddress']}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Mobille No.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${listofMap!['MobileNo']}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${listofMap!['Gender']}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6.0,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                "Education",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "${listofMap!['Education']}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                "Address",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "${listofMap!['Address']}",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: CommonColorConstants.blueLightColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
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
