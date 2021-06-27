import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:schedule_app/home.dart';
import 'package:schedule_app/utility/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utility/ProgressIndicatorLoader.dart';

class ScheduleTable extends StatefulWidget {
  static String id = 'schedule_table';
  final String Id;
  final String Name;
  final int type;
  var body;

  ScheduleTable({this.Id, this.Name, this.body, this.type});

  @override
  _ScheduleTableState createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  List<String> dayList = ['', '', '', '', '', ''];
  List<String> LecNoList = [];
  List<String> LecNoList2 = []; // for to set range of lecture
  List<String> LecTypeList = [];
  List<String> LecCabList = [];
  List<String> LecTimeList = [];
  List<String> LecNameList = [];
  List<String> TeacherNameList = [];
  List<String> Day1Lec = [];
  List<String> Day2Lec = [];
  List<String> Day3Lec = [];
  List<String> Day4Lec = [];
  List<String> Day5Lec = [];
  List<String> Day6Lec = [];
  int forday2;
  int forday3;
  int forday4;
  int forday5;
  int forday6;
  int week = 0;
  bool isLoading = false;


  @override
  void initState() {
    _getSchedule();
  }

  Future<void> _cleanData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('Type');
    await prefs.remove('ID');
    await prefs.remove('Name');
    await prefs.remove('Body');
  }

  void _getSchedule() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
    var json = {'type': '${widget.type}', 'id': widget.Id, 'week': '$week'};
    Response response = await post(url, body: json);
    setState(() {
      isLoading = false;
    });
    // check the status code for the result
    // int statusCode = response.statusCode;
    var document = parse(response.body);
    setState(() {
      dayList = [];
      LecNoList = [];
      LecNoList2 = [];
      LecTypeList = [];
      LecCabList = [];
      LecTimeList = [];
      LecNameList = [];
      TeacherNameList = [];
      Day1Lec = [];
      Day2Lec = [];
      Day3Lec = [];
      Day4Lec = [];
      Day5Lec = [];
      Day6Lec = [];
    });
    // start for loop day and date
    var getDay = document.getElementsByClassName('day');
    for (var days in getDay) {
      var daylist = days.getElementsByTagName('h2');
      for (var day in daylist) {
        dayList.add(day.innerHtml);
      }
    }
    // end for loop for day
    // start loop for lecture number
    var getLecNo = document.getElementsByClassName('number');
    for (var number in getLecNo) {
      if (number.text != ' ') {
        LecNoList.add(number.text);
      }
      LecNoList2.add(number.text);
    }
    var day1 = LecNoList2.getRange(0, 8);
    for (var i in day1) {
      if (i != ' ') {
        Day1Lec.add(i);
      }
    }
    var day2 = LecNoList2.getRange(8, 16);
    for (var i in day2) {
      if (i != ' ') {
        Day2Lec.add(i);
      }
    }
    var day3 = LecNoList2.getRange(16, 24);
    for (var i in day3) {
      if (i != ' ') {
        Day3Lec.add(i);
      }
    }
    var day4 = LecNoList2.getRange(24, 32);
    for (var i in day4) {
      if (i != ' ') {
        Day4Lec.add(i);
      }
    }
    var day5 = LecNoList2.getRange(32, 40);
    for (var i in day5) {
      if (i != ' ') {
        Day5Lec.add(i);
      }
    }
    var day6 = LecNoList2.getRange(40, 48);
    for (var i in day6) {
      if (i != ' ') {
        Day6Lec.add(i);
      }
    }
    // end loop for lecture number
    // start loop for lecture type
    var getLecType = document.getElementsByClassName('type');
    for (var div1 in getLecType) {
      String LecType = div1.text;
      List a = LecType.split(RegExp(r"[0-9]"));
      LecTypeList.add(a.last);
    }
    // end loop for lecture type
    // start loop for lecture cabinate
    var getLecCab = document.getElementsByClassName('cab');
    for (var cab in getLecCab) {
      LecCabList.add(cab.text);
    }
    // end loop for lecture cabinate
    // start loop for lecture time
    var getLecTime = document.getElementsByClassName('time');
    for (var time in getLecTime) {
      LecTimeList.add(time.text);
    }
    // end loop for lecture time
    // start loop for lecture name
    var getLecName = document.getElementsByClassName('name');
    for (var name in getLecName) {
      LecNameList.add(name.text);
    }
    // end loop for lecture name
    // start loop for techer name
    var getTeacherName = document.getElementsByClassName('prep');
    for (var teacherdiv in getTeacherName) {
      var teacherli = teacherdiv.getElementsByTagName('li');
        for(var teacher in teacherli){
          TeacherNameList.add(teacher.text);
        }
    }
    forday2 = Day1Lec.length;
    forday3 = Day1Lec.length + Day2Lec.length;
    forday4 = Day1Lec.length + Day2Lec.length + Day3Lec.length;
    forday5 = Day1Lec.length + Day2Lec.length + Day3Lec.length + Day4Lec.length;
    forday6 = Day1Lec.length +
        Day2Lec.length +
        Day3Lec.length +
        Day4Lec.length +
        Day5Lec.length;
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _cleanData();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.Name,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: theme.primaryColor,
                        // color: Colors.red,
                      ),
                      child: TextButton(
                          child: Container(
                            child: Text(
                              'Пред. неделя',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              week--;
                              _getSchedule();
                            });
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: theme.primaryColor,
                      ),
                      child: TextButton(
                          child: Text(
                            'След. неделя',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              week++;
                              _getSchedule();
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: Border.all(
                                  color: theme.primaryColor, width: 0.6),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '${dayList[0]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Day1Lec.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Builder(builder: (context) {
                                  if (LecNoList[index] != ' ')
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: theme.primaryColor,
                                          width: 0.6,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${LecNoList[index]} ${LecTypeList[index]} ${LecCabList[index]}'),
                                                // №. пара комната №
                                                Text('${LecTimeList[index]}'),
                                                // время
                                              ],
                                            ),
                                            Text('${LecNameList[index]}'),
                                            // subject name
                                            Text('${TeacherNameList[index]}'),
                                            // teacher name
                                          ],
                                        ),
                                      ),
                                    );
                                  else
                                    return Container(
                                      width: 0,
                                      height: 0,
                                    );
                                });
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: Border.all(
                                  color: theme.primaryColor, width: 0.6),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '${dayList[1]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Day2Lec.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Builder(builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: theme.primaryColor,
                                        width: 0.6,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${LecNoList[forday2 + index]} ${LecTypeList[forday2 + index]} ${LecCabList[forday2 + index]}'),
                                              // №. пара комната №
                                              Text(
                                                  '${LecTimeList[forday2 + index]}'),
                                              // время
                                            ],
                                          ),
                                          Text(
                                              '${LecNameList[forday2 + index]}'),
                                          // subject name
                                          Text(
                                              '${TeacherNameList[forday2 + index]}'),
                                          // teacher name
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: Border.all(
                                  color: theme.primaryColor, width: 0.6),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '${dayList[2]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Day3Lec.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Builder(builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: theme.primaryColor,
                                        width: 0.6,
                                      ),
                                    ),
                                    width: 10,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${LecNoList[forday3 + index]} ${LecTypeList[forday3 + index]} ${LecCabList[forday3 + index]}'),
                                              // №. пара комната №
                                              Text(
                                                  '${LecTimeList[forday3 + index]}'),
                                              // время
                                            ],
                                          ),
                                          Text(
                                              '${LecNameList[forday3 + index]}'),
                                          // subject name
                                          Text(
                                              '${TeacherNameList[forday3 + index]}'),
                                          // teacher name
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: Border.all(
                                color: theme.primaryColor,
                                width: 0.6,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '${dayList[3]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Day4Lec.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Builder(builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: theme.primaryColor,
                                        width: 0.6,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${LecNoList[forday4 + index]} ${LecTypeList[forday4 + index]} ${LecCabList[forday4 + index]}'),
                                              // №. пара комната №
                                              Text(
                                                  '${LecTimeList[forday4 + index]}'),
                                              // время
                                            ],
                                          ),
                                          Text(
                                              '${LecNameList[forday4 + index]}'),
                                          // subject name
                                          Text(
                                              '${TeacherNameList[forday4 + index]}'),
                                          // teacher name
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: Border.all(
                                  color: theme.primaryColor, width: 0.6),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '${dayList[4]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Day5Lec.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Builder(builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: theme.primaryColor,
                                        width: 0.6,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${LecNoList[forday5 + index]} ${LecTypeList[forday5 + index]} ${LecCabList[forday5 + index]}'),
                                              // №. пара комната №
                                              Text(
                                                  '${LecTimeList[forday5 + index]}'),
                                              // время
                                            ],
                                          ),
                                          Text(
                                              '${LecNameList[forday5 + index]}'),
                                          // subject name
                                          Text(
                                              '${TeacherNameList[forday5 + index]}'),
                                          // teacher name
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              border: Border.all(
                                  color: theme.primaryColor, width: 0.6),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '${dayList[5]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Day6Lec.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Builder(builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: theme.primaryColor,
                                        width: 0.6,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${LecNoList[forday6 + index]} ${LecTypeList[forday6 + index]} ${LecCabList[forday6 + index]}'),
                                              // №. пара комната №
                                              Text(
                                                  '${LecTimeList[forday6 + index]}'),
                                              // время
                                            ],
                                          ),
                                          Text(
                                              '${LecNameList[forday6 + index]}'),
                                          // subject name
                                          Text(
                                              '${TeacherNameList[forday6 + index]}'),
                                          // teacher name
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ProgressIndicatorLoader(Colors.white, isLoading)
        ],
      ),
    );
  }
}
