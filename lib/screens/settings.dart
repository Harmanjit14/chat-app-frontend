import 'package:Huddle/constants/text.dart';
import 'package:Huddle/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  MyProfile myprofile = Get.put(MyProfile());
  @override
  Widget build(BuildContext context) {
    myprofile.email.value = "harmanjit@gmail.com";
    myprofile.name.value = "Harmanjit Singh";
    Size size = MediaQuery.of(context).size;
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
        ],
      ),
    );
  }
}
