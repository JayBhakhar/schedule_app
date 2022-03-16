import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/service/theme_service.dart';
import 'package:schedule_app/views/pages/Schedule/schedule_controller.dart';

Widget scheduleTable() {
  print('outside obx ${scheduleController.lecNameList}');
  return Column(
    children: [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService().cardColor,
              border: Border.all(
                color: ThemeService().primaryColor,
                width: 0.6,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Obx(() {
                  return Text(
                    '${scheduleController.dayList[0]}',
                    style: TextStyle(
                      color: ThemeService().bodyText2,
                    ),
                  );
                }),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleController.day1Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService().primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Obx(
                      () {
                        print('inside obx ${scheduleController.lecNameList}');
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${scheduleController.lecNoList[index]} ${scheduleController.lecTypeList[index]} ${scheduleController.lecCabList[index]}'),
                                // №. пара комната №
                                Text(
                                  '${scheduleController.lecTimeList[index]}',
                                ),
                                // время
                              ],
                            ),
                            Text(
                              '${scheduleController.lecNameList[index]}',
                            ),
                            // subject name
                            Text(
                              '${scheduleController.teacherNameList[index]}${scheduleController.groupList[index]}',
                            ),
                            // teacher name
                          ],
                        );
                      },
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService().cardColor,
              border:
                  Border.all(color: ThemeService().primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${scheduleController.dayList[1]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleController.day2Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService().primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${scheduleController.lecNoList[scheduleController.forday2 + index]} ${scheduleController.lecTypeList[scheduleController.forday2 + index]} ${scheduleController.lecCabList[scheduleController.forday2 + index]}',
                            ),
                            // №. пара комната №
                            Text(
                              '${scheduleController.lecTimeList[scheduleController.forday2 + index]}',
                            ),
                            // время
                          ],
                        ),
                        Text(
                          '${scheduleController.lecNameList[scheduleController.forday2 + index]}',
                        ),
                        // subject name
                        Text(
                          '${scheduleController.teacherNameList[scheduleController.forday2 + index]}${scheduleController.groupList[scheduleController.forday2 + index]}',
                        ),
                        // teacher name
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService().cardColor,
              border:
                  Border.all(color: ThemeService().primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${scheduleController.dayList[2]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleController.day3Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService().primaryColor,
                      width: 0.6,
                    ),
                  ),
                  width: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${scheduleController.lecNoList[scheduleController.forday3 + index]} ${scheduleController.lecTypeList[scheduleController.forday3 + index]} ${scheduleController.lecCabList[scheduleController.forday3 + index]}',
                            ),
                            // №. пара комната №
                            Text(
                              '${scheduleController.lecTimeList[scheduleController.forday3 + index]}',
                            ),
                            // время
                          ],
                        ),
                        Text(
                          '${scheduleController.lecNameList[scheduleController.forday3 + index]}',
                        ),
                        // subject name
                        Text(
                          '${scheduleController.teacherNameList[scheduleController.forday3 + index]}${scheduleController.groupList[scheduleController.forday3 + index]}',
                        ),
                        // teacher name
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService().cardColor,
              border: Border.all(
                color: ThemeService().primaryColor,
                width: 0.6,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${scheduleController.dayList[3]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleController.day4Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService().primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${scheduleController.lecNoList[scheduleController.forday4 + index]} ${scheduleController.lecTypeList[scheduleController.forday4 + index]} ${scheduleController.lecCabList[scheduleController.forday4 + index]}',
                            ),
                            // №. пара комната №
                            Text(
                              '${scheduleController.lecTimeList[scheduleController.forday4 + index]}',
                            ),
                            // время
                          ],
                        ),
                        Text(
                          '${scheduleController.lecNameList[scheduleController.forday4 + index]}',
                        ),
                        // subject name
                        Text(
                          '${scheduleController.teacherNameList[scheduleController.forday4 + index]}${scheduleController.groupList[scheduleController.forday4 + index]}',
                        ),
                        // teacher name
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService().cardColor,
              border:
                  Border.all(color: ThemeService().primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${scheduleController.dayList[4]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleController.day5Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService().primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${scheduleController.lecNoList[scheduleController.forday5 + index]} ${scheduleController.lecTypeList[scheduleController.forday5 + index]} ${scheduleController.lecCabList[scheduleController.forday5 + index]}',
                            ),
                            // №. пара комната №
                            Text(
                              '${scheduleController.lecTimeList[scheduleController.forday5 + index]}',
                            ),
                            // время
                          ],
                        ),
                        Text(
                          '${scheduleController.lecNameList[scheduleController.forday5 + index]}',
                        ),
                        // subject name
                        Text(
                          '${scheduleController.teacherNameList[scheduleController.forday5 + index]}${scheduleController.groupList[scheduleController.forday5 + index]}',
                        ),
                        // teacher name
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService().cardColor,
              border:
                  Border.all(color: ThemeService().primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${scheduleController.dayList[5]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleController.day6Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService().primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${scheduleController.lecNoList[scheduleController.forday6 + index]} ${scheduleController.lecTypeList[scheduleController.forday6 + index]} ${scheduleController.lecCabList[scheduleController.forday6 + index]}',
                            ),
                            // №. пара комната №
                            Text(
                              '${scheduleController.lecTimeList[scheduleController.forday6 + index]}',
                            ),
                            // время
                          ],
                        ),
                        Text(
                          '${scheduleController.lecNameList[scheduleController.forday6 + index]}',
                        ),
                        // subject name
                        Text(
                          '${scheduleController.teacherNameList[scheduleController.forday6 + index]}${scheduleController.groupList[scheduleController.forday6 + index]}',
                        ),
                        // teacher name
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    ],
  );
}
