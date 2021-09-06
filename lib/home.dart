import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/ads/ad_state.dart';
import 'package:schedule_app/devloper_page.dart';
import 'package:schedule_app/room/room_schedule_table.dart';
import 'package:schedule_app/room/rooms_list.dart';
import 'package:schedule_app/utility/ProgressIndicatorLoader.dart';
import 'package:schedule_app/utility/choose_colors/choose_colors_screen.dart';
import 'package:schedule_app/utility/lists.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:schedule_app/teacher/teachers_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'student/groups_list.dart';
import 'schedule_table.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  static _HomeState of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeState>();
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
  SharedPreferences prefs;
  final ScrollController scrollController = ScrollController();

  void initState() {
    getSharedPreferenceObject();
    super.initState();
  }

  Future<void> getSharedPreferenceObject() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('Type') == null) {
      print('no data');
    } else if (prefs.getInt('Type') == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoomScheduleTable(
            type: prefs.getInt('Type'),
            Id: prefs.getString('Room_ID'),
            Name: prefs.getString('Room_Name'),
            body: prefs.getString('Body'),
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScheduleTable(
            type: prefs.getInt('Type'),
            Id: prefs.getString('ID'),
            Name: prefs.getString('Name'),
            body: prefs.getString('Body'),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent == 0.0
            ? 350
            : scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInExpo,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Расписание СФ БашГУ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DevloperPage(),
                ),
              );
            }, // Todo: make a page developer
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseColorsScreen(),
                ),
              );
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
            controller: scrollController,
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
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(top: 1.5),
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text(
                              faculty[index],
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyText2,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 8.0,
                ),
                Builder(builder: (context) {
                  if (facultyIndex == 0) {
                    return GroupsList(groupMap: groupMap);
                  } else if (facultyIndex == 1)
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
                  else if (facultyIndex == 11)
                    return TeachersList();
                  else if (facultyIndex == 12)
                    return RoomsList();
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
