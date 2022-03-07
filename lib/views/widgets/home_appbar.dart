import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/consts/consts.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_controller.dart';

HomeController controller = Get.find();

Widget homeAppBar() {
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
          onDoubleTap: () {
            Get.toNamed('devloper');
          },
          onTap: () {
            Get.toNamed('choosecolors');
          }, //Todo: choose colors
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Icon(
              Icons.brush,
              color: ThemeService().primaryColor,
            ),
          ),
        ),
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
