import 'package:Huddle/screens/log_holder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Huddle',
      theme: ThemeData.light(),
      home: Login(),
    );
  }
}
