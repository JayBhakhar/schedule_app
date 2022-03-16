import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Schedule/schedule_controller.dart';
import 'package:schedule_app/views/widgets/schedule_table.dart';

class ScheduleView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
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
                          scheduleController.weekDecrease();
                        }),
                  ),
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
                          scheduleController.weekIncrease();
                        }),
                  ),
                ],
              ),
            ),
            GetBuilder<ScheduleController>(builder: (controller) {
              return controller.isLoading
                  ? CircularProgressIndicator()
                  : scheduleTable();
            }),
            
          ],
        ),
      ),
    );
  }
}
