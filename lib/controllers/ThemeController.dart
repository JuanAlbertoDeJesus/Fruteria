import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  final darkTheme = const NeumorphicThemeData(
    baseColor: Color(0xff333333),
    accentColor: Color.fromARGB(255, 76, 175, 81),
    lightSource: LightSource.topLeft,
    depth: 4,
    intensity: 0.3,
  );

  final lightTheme = const NeumorphicThemeData(
    baseColor: Color(0xffDDDDDD),
    accentColor: Color.fromARGB(183, 0, 205, 212),
    lightSource: LightSource.topLeft,
    depth: 6,
    intensity: 0.5,
  );
  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
