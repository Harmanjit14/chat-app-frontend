import 'package:Huddle/constants/text.dart';
import 'package:Huddle/models/profile.dart';
import 'package:Huddle/models/themedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final myprofile = Get.put(MyProfile());
  final themedata = Get.put(ThemeChanger());
  @override
  Widget build(BuildContext context) {
    myprofile.email.value = "harmanjit@gmail.com";
    myprofile.name.value = "Harmanjit Singh";
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        shrinkWrap: true,
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/cover.webp",
                        fit: BoxFit.cover,
                      )),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    height: 150,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.all(7),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    height: 40,
                    width: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          (myprofile.verified.value)
                              ? Icons.verified
                              : Icons.error,
                          color: (myprofile.verified.value)
                              ? Colors.green
                              : Colors.red,
                        ),
                        SizedBox(width: 7),
                        BoldText(
                          text: (myprofile.verified.value)
                              ? "Verified"
                              : "Not Verified",
                          color: Colors.grey,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Obx(
              () => BoldText(
                text: myprofile.name.value,
                color: (themedata.isDark.value) ? Colors.white : Colors.black,
                size: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: RegularText(
              text: myprofile.email.value,
              color: Colors.grey[600],
              size: 15,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ButtonStyle(
              enableFeedback: true,
            ),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                          text: "Profile",
                          color: Colors.white,
                          size: 20,
                        ),
                        RegularText(
                          text: "privacy, location, statistics",
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              enableFeedback: true,
            ),
            onPressed: () {
              themedata.isDark.value = (Get.isDarkMode ? false : true);
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.message,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(
                          text: "Chats",
                          color: Colors.white,
                          size: 20,
                        ),
                        RegularText(
                          text: "theme, wallpaper, history",
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
