import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schedule_app/get_pages.dart';
import 'package:schedule_app/service/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: 'Расписание СФ БашГУ',
    theme: ThemeData(
      primaryColor: ThemeService.primaryColor,
      cardColor: ThemeService.cardColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: ThemeService.bodyText1,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          color: ThemeService.bodyText2,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    getPages: getPagesList,
    initialRoute: '/home',
  ));
}
