import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/consts/consts.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent == 0.0 ? 350 : 550,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInExpo,
      );
    }
    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: faculty.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: ThemeService().cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(top: 1.5),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      faculty[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeService().bodyText2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

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
}
