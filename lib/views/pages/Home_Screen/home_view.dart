import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/consts/consts.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_controller.dart';
import 'package:schedule_app/views/widgets/buildings_list.dart';
import 'package:schedule_app/views/widgets/groups_list.dart';
import 'package:schedule_app/views/widgets/home_appbar.dart';
import 'package:schedule_app/views/widgets/letters_list.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: faculty.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    controller.index = index.obs;
                    if (index == 0) {
                      controller.facultyId = 4.obs;
                      controller.getGroupsList();
                    } else if (index == 1) {
                      controller.facultyId = 5.obs;
                      controller.getGroupsList();
                    } else if (index == 2) {
                      controller.facultyId = 6.obs;
                      controller.getGroupsList();
                    } else if (index == 3) {
                      controller.facultyId = 7.obs;
                      controller.getGroupsList();
                    } else if (index == 4) {
                      controller.facultyId = 8.obs;
                      controller.getGroupsList();
                    } else if (index == 5) {
                      controller.facultyId = 9.obs;
                      controller.getGroupsList();
                    } else if (index == 6) {
                      controller.facultyId = 10.obs;
                      controller.getGroupsList();
                    } else if (index == 7) {
                      controller.facultyId = 18.obs;
                      controller.getGroupsList();
                    } else if (index == 8) {
                      controller.facultyId = 26.obs;
                      controller.getGroupsList();
                    } else if (index == 9) {
                      controller.facultyId = 27.obs;
                      controller.getGroupsList();
                    } else if (index == 10) {
                      controller.facultyId = 127.obs;
                      controller.getGroupsList();
                    } else if (index == 11) {
                      controller.getLettersList();
                    } else if (index == 12) {
                      controller.getBuildingsList();
                    }
                  },
                  child: Container(
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
                  ),
                );
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            GetBuilder<HomeController>(builder: (controller) {
              if (controller.index <= 10) {
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : groupsList();
                // ignore: unrelated_type_equality_checks
              } else if (controller.index == 11) {
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : lettersList();
                // ignore: unrelated_type_equality_checks
              } else if (controller.index == 12) {
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : buildingsList();
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
