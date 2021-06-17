import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int faculty_id = 7;
  var body = '';
  List<String> dayList = [];
  List<String> LecNoList = [];
  List<String> LecTypeList = [];
  List<String> LecCabList = [];
  List<String> LecTimeList = [];
  List<String> LecNameList = [];
  List<String> TeacherNameList = [];
  List<String> MondayLec = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () async {
            final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
            var json = {'type': '2', 'id': '10173', 'week': '-1'};
            Response response = await post(url, body: json);
            // check the status code for the result
            // int statusCode = response.statusCode;
            var document = parse(response.body);
            setState(() {
              dayList = [];
              LecNoList = [];
              LecTypeList = [];
              LecCabList = [];
              LecTimeList = [];
              LecNameList = [];
              TeacherNameList = [];
              MondayLec = [];
            });
            // start for loop day and date
            var getDay = document.getElementsByClassName('day');
            for (var days in getDay) {
              var daylist = days.getElementsByTagName('h2');
              for (var day in daylist) {
                dayList.add(day.innerHtml);
              }
            } // end for loop for day
            // start loop for lecture number
            var getLecNo = document.getElementsByClassName('number');
            for (var number in getLecNo) {
              // if (number.text != ' ') {
              //   LecNoList.add(number.text);
              // }
              LecNoList.add(number.text);
            }
            print(LecNoList);
            var a = LecNoList.getRange(0, 8);
            print(a.length);
            for (var i in a){
              if(i != ' '){
                MondayLec.add(i);
              }
            }
            print(MondayLec.length);
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
            for (var teacher in getTeacherName) {
              TeacherNameList.add(teacher.text);
            }
            // end loop for Teacher name
            // print(response.body);
          },
          child: Text('Test'),
        ),
        Column(
          children: [
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: dayList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(0.5),
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              '${dayList[index]}',
                            ),
                          ),
                        ),
                        ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Builder(builder: (context) {
                                if (LecNoList[index] != ' ')
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    width: 10,
                                    height: 70,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                  );
                }),
          ],
        ),
      ],
    );
  }
}
