import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/lists.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'groups_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int facultyId;
  int facultyIndex;
  int groupIndex;
  var body = '';
  List<String> groupList = [];
  List<String> groupId = [];
  Map<String, String> groupMap = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Расписание СФ БашГУ')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: faculty.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Center(
                      child: Text(
                        '${faculty[index]}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        facultyIndex = index;
                        if (facultyIndex == 0) {
                          setState(() {
                            facultyId = 4;
                          });
                        } else if (facultyIndex == 1) {
                          setState(() {
                            facultyId = 5;
                          });
                        } else if (facultyIndex == 2) {
                          setState(() {
                            facultyId = 6;
                          });
                        } else if (facultyIndex == 3) {
                          setState(() {
                            facultyId = 7;
                          });
                        } else if (facultyIndex == 4) {
                          setState(() {
                            facultyId = 8;
                          });
                        } else if (facultyIndex == 5) {
                          setState(() {
                            facultyId = 9;
                          });
                        } else if (facultyIndex == 6) {
                          setState(() {
                            facultyId = 10;
                          });
                        } else if (facultyIndex == 7) {
                          setState(() {
                            facultyId = 18;
                          });
                        } else if (facultyIndex == 8) {
                          setState(() {
                            facultyId = 26;
                          });
                        } else if (facultyIndex == 9) {
                          setState(() {
                            facultyId = 27;
                          });
                        } else if (facultyIndex == 10) {
                          setState(() {
                            facultyId = 127;
                          });
                        }
                      });
                      final url = Uri.parse(
                          'http://edu.strbsu.ru/php/getList.php?faculty=$facultyId');
                      Map<String, String> headers = {
                        "Content-type": "application/json"
                      };
                      Response response = await get(url, headers: headers);
                      // int statusCode = response.statusCode;
                      var document = parse(response.body);
                      var ul = document.getElementsByTagName('ul');
                      if (groupList.isNotEmpty) {
                        setState(() {
                          groupId = [];
                          groupList = [];
                          groupMap = Map();
                        });
                      }
                      for (var ullist in ul) {
                        var divlist = ullist.getElementsByTagName('div');
                        for (var atext in divlist) {
                          groupId.add(atext.innerHtml);
                        }
                      }
                      for (var ullist in ul) {
                        var alist = ullist.getElementsByTagName('a');
                        for (var atext in alist) {
                          groupList.add(atext.innerHtml);
                        }
                      }
                      groupMap = Map.fromIterables(groupId, groupList);
                    },
                  );
                }),
            Builder(builder: (context) {
              if (facultyIndex == 0)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 1)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 2)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 3)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 4)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 5)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 6)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 7)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 8)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 9)
                return GroupsList(groupMap: groupMap);
              else if (facultyIndex == 10)
                return GroupsList(groupMap: groupMap);
              else
                return Container(
                  width: 0,
                  height: 0,
                );
            }),
          ],
        ),
      ),
    );
  }
}
