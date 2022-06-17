import 'package:animation_demo/constants/color_constants.dart';
import 'package:animation_demo/constants/image_constants.dart';
import 'package:animation_demo/utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class HeaderNavigationBar extends StatelessWidget {
  const HeaderNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      return Card(
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
              // Icon(
              //   Icons.menu,
              //   size: 24.0,
              //   color: Colors.black,
              // ),
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
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 16.0,
              ),
            ],
          ),
        ),
      );
    } else if (ResponsiveWidget.isSmallScreen(context)) {
      return Card(
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
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
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
      );
    } else {
      return Card(
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          height: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.menu,
              //   size: 24.0,
              //   color: Colors.black,
              // ),
              // const SizedBox(
              //   width: 12.0,
              // ),
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
      );
    }
  }
}
