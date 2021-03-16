// import 'package:Huddle/models/themedata.dart';
import 'package:Huddle/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Huddle',
      theme: ThemeData.light(),
      home: Theme(),
    );
  }
}

class Theme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adb),
        onPressed: () {
          Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        },
      ),
      body: Container(
        child: Center(
          child: ShadowBoldText(
            text: "Hello World",
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
