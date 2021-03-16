// import 'package:Huddle/models/themedata.dart';
// import 'package:Huddle/constants/text.dart';
import 'package:Huddle/screens/chats.dart';
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
      home: AllChats(),
    );
  }
}
