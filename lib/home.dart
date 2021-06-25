import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/ProgressIndicatorLoader.dart';
import 'package:schedule_app/lists.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'groups_list.dart';
import 'schedule_table.dart';

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
  bool isLoading = false;
  bool isDark = false;
  SharedPreferences prefs;

  @override
  initState() {
    getSharedPreferenceObject();
  }

  Future<void> getSharedPreferenceObject() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('groupID') == null) {
      print('no data');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScheduleTable(
            groupId: prefs.getString('groupID'),
            group_name: prefs.getString('groupName'),
            body: prefs.getString('body'),
          ),
        ),
      );
    }
    setState(() {
      isDark = prefs.getBool("isDark");
    });
  }

  Future<void> changeTheme() async {
    await DynamicTheme.of(context)
        .setBrightness(!isDark ? Brightness.dark : Brightness.light);
    isDark = !isDark;
    prefs.setBool("isDark", isDark);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Расписание СФ БашГУ')),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              changeTheme();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Icon(
                Icons.brush,
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _launchInBrowser("https://strbsu.ru/");
              },
              child: Icon(
                Icons.info,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: faculty.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
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
                          setState(() {
                            isLoading = false;
                          });
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
                        child: Container(
                          margin: EdgeInsets.only(top: 1.5),
                          // color: index%2==0?theme.cardColor:Colors.black12,
                          color: theme.cardColor,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text(
                              faculty[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 8.0,
                ),
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
          ProgressIndicatorLoader(Colors.white, isLoading)
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
