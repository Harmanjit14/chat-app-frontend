import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeChanger extends GetxController {
  RxBool isDark = false.obs;
  RxBool get getIsDark => this.isDark;

  set setIsDark(RxBool isDark) => this.isDark = isDark;
}

ThemeData light = ThemeData(
  brightness: Brightness.light,
);
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
);
