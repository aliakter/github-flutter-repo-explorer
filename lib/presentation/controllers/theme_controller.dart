import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;

  @override
  void onInit() {
    isDark.value = Hive.box('settings').get('darkMode', defaultValue: false);
    super.onInit();
  }

  void toggleTheme() {
    isDark.value = !isDark.value;
    Hive.box('settings').put('darkMode', isDark.value);
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
