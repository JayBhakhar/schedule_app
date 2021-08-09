import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:schedule_app/home.dart';
import 'package:schedule_app/utility/ProgressIndicatorLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../schedule_table.dart';

class TeachersList extends StatefulWidget {
  @override
  _TeachersListState createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  List<String> lettersList = [];
  List<String> lettersId = [];
  Map<String, String> letterMap = Map();
  List<String> teacherNameList = [];
  List<String> teacherNameId = [];
  Map<String, String> teacherNameMap = Map();
  String body = '';
  String teacher_id;
  String teacher_name;
  bool isLoading = false;

  @override
  initState() {
    _getLetter();
  }

  Future<void> _saveTeacherID() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Type', 1);
    await prefs.setString('ID', teacher_id);
    await prefs.setString('Name', teacher_name);
    await prefs.setString('Body', body);
  }

  Future<void> _getLetter() async {
    final url = Uri.parse('http://edu.strbsu.ru/php/getList.php?prepList=1');
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
    var letters = document.getElementsByTagName('div');
    for (var letter in letters) {
      var letID = letter.attributes['onclick'];
      var numberletID = letID.replaceAll(RegExp('[^0-9]'), '');
      lettersList.add(letter.text);
      lettersId.add(numberletID);
    }
    letterMap = Map.fromIterables(lettersId, lettersList);
    // print(lettersId);
    // print(lettersList);
  }

  Widget build(BuildContext context) {
    print(
        'techear :-------- ${Home.of(context).scrollController.position.maxScrollExtent}');
    if (Home.of(context).scrollController.hasClients) {
      Home.of(context).scrollController.animateTo(
            Home.of(context).scrollController.position.maxScrollExtent ==
                    132.40909090909088
                ? 550
                : Home.of(context).scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
    }
    return Container(
      margin: EdgeInsets.only(left: 6.0, right: 6.0),
      child: Stack(children: [
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
                      setState(() {
                        isLoading = true;
                      });
                      final url = Uri.parse(
                          'http://edu.strbsu.ru/php/getList.php?letter=${letterMap.keys.toList()[index]}');
                      Response response = await get(url);
                      // int statusCode = response.statusCode;
                      setState(() {
                        isLoading = false;
                      });
                      var document = parse(response.body);
                      setState(() {
                        teacherNameList = [];
                        teacherNameId = [];
                        teacherNameMap = Map();
                      });
                      // start for loop for teacherName
                      var teacherNames =
                          document.getElementsByClassName('prep_name');
                      for (var teacherName in teacherNames) {
                        var teaNameIDAttribute =
                            teacherName.attributes['onclick'];
                        var teaNameIDstr =
                            teaNameIDAttribute.replaceAll(RegExp('[^0-9]'), '');
                        var teaNameID =
                            teaNameIDstr.substring(2, teaNameIDstr.length - 1);
                        teacherNameList.add(teacherName.text);
                        teacherNameId.add(teaNameID);
                      } // end for loop for teacherName
                      teacherNameMap =
                          Map.fromIterables(teacherNameId, teacherNameList);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Theme.of(context).cardColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(top: 1.5),
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                        child: Center(
                          child: Text(
                            lettersList[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 5.0,
            ),
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
                    setState(() {
                      isLoading = true;
                    });
                    final url =
                        Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
                    var json = {
                      'type': '1',
                      'id': teacherNameMap.keys.toList()[index],
                      'week': '0'
                    };
                    // type = 1 for teacher
                    // type = 2 for student
                    // type = 3 for room no
                    Response response = await post(url, body: json);
                    // check the status code for the result
                    // int statusCode = response.statusCode;
                    setState(() {
                      isLoading = false;
                    });
                    setState(() {
                      body = response.body;
                      teacher_id = teacherNameMap.keys.toList()[index];
                      teacher_name = teacherNameMap.values.toList()[index];
                    });
                    _saveTeacherID();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ScheduleTable(
                            type: 1,
                            Id: teacherNameMap.keys.toList()[index],
                            Name: teacherNameMap.values.toList()[index],
                            body: body,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.only(top: 1.5),
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                      child: Center(
                        child: Text(
                          teacherNameList[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        ProgressIndicatorLoader(Colors.white, isLoading)
      ]),
    );
  }
}
