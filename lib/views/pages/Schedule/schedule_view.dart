import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_controller.dart';
import 'package:schedule_app/views/pages/Schedule/schedule_controller.dart';
import 'package:schedule_app/views/widgets/schedule_table.dart';

class ScheduleView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var data = box.read('data');
    var arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            box.remove('data');
            Get.back();
          },
        ),
        title: Text(box.hasData('data') ? data['name'] : arg['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: ThemeService().primaryColor,
                    ),
                    child: TextButton(
                        child: Container(
                          child: Text('Пред. неделя',
                              style: TextStyle(
                                color: ThemeService().bodyText1,
                              )),
                        ),
                        onPressed: () {
                          controller.weekDecrease();
                        }),
                  ),
                  if (Get.find<HomeController>().facultyId == 7)
                    Text('ФМиИТ Пушка💗'),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: ThemeService().primaryColor,
                    ),
                    child: TextButton(
                        child: Container(
                          child: Text('Пред. неделя',
                              style: TextStyle(
                                color: ThemeService().bodyText1,
                              )),
                        ),
                        onPressed: () {
                          controller.weekIncrease();
                        }),
                  ),
                ],
              ),
            ),
            GetBuilder<ScheduleController>(
              builder: (controller) => controller.isLoading
                  ? CircularProgressIndicator()
                  : scheduleTable(),
            ),
          ],
        ),
      ),
    );
  }
}
