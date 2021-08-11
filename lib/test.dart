import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:schedule_app/schedule_table.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> lettersList = [];
  List<String> lettersId = [];
  List<String> teacherNameList = [];
  List<String> teacherNameID = [];
  Map<String, String> letterMap = Map();
  Map<String, String> teacherNameMap = Map();
  String body = '';
  String group_id;
  String group_name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Scaffold(
          body: ListView(
            children: [
              TextButton(
                onPressed: () async {
                  final url =
                      Uri.parse('http://edu.strbsu.ru/php/getList.php?prepList=1');
                  // Response response = await post(url, body: json);
                  Response response = await get(url);
                  // check the status code for the result
                  // int statusCode = response.statusCode;
                  var document = parse(response.body);
                  setState(() {
                    lettersList = [];
                    lettersId = [];
                    letterMap = Map();
                  });
                  // start for loop day and date
                  var letters = document.getElementsByTagName('div');
                  for (var letter in letters) {
                    var letID = letter.attributes['onclick'];
                    var numberletID = letID.replaceAll(RegExp('[^0-9]'), '');
                    lettersList.add(letter.text);
                    lettersId.add(numberletID);
                  } // end for loop for day
                  letterMap = Map.fromIterables(lettersId, lettersList);
                
                },
                child: Text('Test'),
              ),
              Column(
                children: [
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: letterMap.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 60.0,
                        mainAxisExtent: 30,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            final url = Uri.parse(
                                'http://edu.strbsu.ru/php/getList.php?letter=${letterMap.keys.toList()[index]}');
                            Response response = await get(url);
                            // int statusCode = response.statusCode;
                            var document = parse(response.body);
                            setState(() {
                              teacherNameList = [];
                              teacherNameID = [];
                              teacherNameMap = Map();
                            });
                            // start for loop for teacherName
                            var teacherNames =
                                document.getElementsByClassName('prep_name');
                            for (var teacherName in teacherNames) {
                              var teaNameIDAttribute =
                                  teacherName.attributes['onclick'];
                              var teaNameIDstr = teaNameIDAttribute.replaceAll(
                                  RegExp('[^0-9]'), '');
                              var teaNameID = teaNameIDstr.substring(
                                  2, teaNameIDstr.length - 1);
                              teacherNameList.add(teacherName.text);
                              teacherNameID.add(teaNameID);
                            } // end for loop for teacherName
                            teacherNameMap =
                                Map.fromIterables(teacherNameID, teacherNameList);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black87,
                            )),
                            margin: EdgeInsets.only(top: 1.5),
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                              child: Center(
                                child: Text(
                                  lettersList[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: teacherNameMap.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 130.0,
                      mainAxisExtent: 30,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
                          var json = {'type': '1', 'id': teacherNameMap.keys.toList()[index], 'week': '0'};
                          // type = 1 for teacher
                          // type = 2 for student
                          // type = 3 for room no
                          Response response = await post(url, body: json);
                          // check the status code for the result
                          // int statusCode = response.statusCode;
                          setState(() {
                            body = response.body;
                            group_id = teacherNameMap.keys.toList()[index];
                            group_name = teacherNameMap.values.toList()[index];
                          });
                          // _saveGroupID();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ScheduleTable(
                                  type: 1,
                                  Id : teacherNameMap.keys.toList()[index],
                                  Name : teacherNameMap.values.toList()[index],
                                  body : body,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black87,
                              )),
                          margin: EdgeInsets.only(top: 1.5),
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                            child: Center(
                              child: Text(
                                teacherNameList[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
