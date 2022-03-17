import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/consts/consts.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_controller.dart';

Widget homeAppBar() {
  final HomeController controller = Get.find();
  return AppBar(
      title: Center(
        child: Text(
          'Расписание СФ БашГУ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Icon(
                Icons.person,
                color: ThemeService.primaryColor,
              ),
            ),
            onTap: () {
              Get.toNamed('devloper');
            }),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              controller.launchInBrowser(lunchUrl);
            },
            child: Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        )
      ]);
}
