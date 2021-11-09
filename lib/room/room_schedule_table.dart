import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/ads/ad_state.dart';
import 'package:schedule_app/utility/ProgressIndicatorLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RoomScheduleTable extends StatefulWidget {
  final String id;
  final String name;
  final int type;
  var body;

  RoomScheduleTable({this.id, this.name, this.body, this.type});

  @override
  _RoomScheduleTableState createState() => _RoomScheduleTableState();
}

class _RoomScheduleTableState extends State<RoomScheduleTable> {
  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      banner = BannerAd(
        adUnitId: adState.bannerAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: adState.listener,
      )..load();
    });
  }

  List<String> dayList = ['', '', '', '', '', ''];
  List<String> lecNoList = [];
  List<String> lecNoList2 = []; // for to set range of lecture
  List<String> lecTypeList = [];
  List<String> lecCabList = [];
  List<String> lecTimeList = [];
  List<String> lecNameList = [];
  List<String> teacherNameAndGroupList = [];
  List<String> teacherNameList = [];
  List<String> groupList = [];
  List<String> day1Lec = [];
  List<String> day2Lec = [];
  List<String> day3Lec = [];
  List<String> day4Lec = [];
  List<String> day5Lec = [];
  List<String> day6Lec = [];
  int forday2;
  int forday3;
  int forday4;
  int forday5;
  int forday6;
  int week = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getSchedule();
  }

  Future<void> _cleanData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('Type');
    await prefs.remove('Room_ID');
    await prefs.remove('Room_Name');
    await prefs.remove('Body');
  }

  void _getSchedule() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
    var json = {'type': '${widget.type}', 'id': widget.id, 'week': '$week'};
    Response response = await post(url, body: json);
    setState(() {
      isLoading = false;
    });
    // check the status code for the result
    // int statusCode = response.statusCode;
    var document = parse(response.body);
    setState(() {
      dayList = [];
      lecNoList = [];
      lecNoList2 = [];
      lecTypeList = [];
      lecCabList = [];
      lecTimeList = [];
      lecNameList = [];
      teacherNameAndGroupList = [];
      teacherNameList = [];
      groupList = [];
      day1Lec = [];
      day2Lec = [];
      day3Lec = [];
      day4Lec = [];
      day5Lec = [];
      day6Lec = [];
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
    var getLec = document.getElementsByClassName('lesson');
    for (var number in getLec) {
      if (number.text != '') {
        lecNoList.add(number.text[0] + number.text[1]);
      }
      lecNoList2.add(number.text);
    }

    var day1 = lecNoList2.getRange(0, 8);
    for (var i in day1) {
      if (i != '') {
        day1Lec.add(i);
      }
    }
    var day2 = lecNoList2.getRange(8, 16);
    for (var i in day2) {
      if (i != '') {
        day2Lec.add(i);
      }
    }
    var day3 = lecNoList2.getRange(16, 24);
    for (var i in day3) {
      if (i != '') {
        day3Lec.add(i);
      }
    }
    var day4 = lecNoList2.getRange(24, 32);
    for (var i in day4) {
      if (i != '') {
        day4Lec.add(i);
      }
    }
    var day5 = lecNoList2.getRange(32, 40);
    for (var i in day5) {
      if (i != '') {
        day5Lec.add(i);
      }
    }
    var day6 = lecNoList2.getRange(40, 48);
    for (var i in day6) {
      if (i != '') {
        day6Lec.add(i);
      }
    }
    // end loop for lecture number
    // start loop for lecture type
    var getLecType = document.getElementsByClassName('type');
    for (var div1 in getLecType) {
      String lecType = div1.text;
      List a = lecType.split(RegExp(r"[0-9]"));
      lecTypeList.add(a.last);
    }
    // end loop for lecture type
    // start loop for lecture cabinate
    var getLecCab = document.getElementsByClassName('cab');
    for (var cab in getLecCab) {
      lecCabList.add(cab.text);
    }
    // end loop for lecture cabinate
    // start loop for lecture time
    var getLecTime = document.getElementsByClassName('time');
    for (var time in getLecTime) {
      lecTimeList.add(time.text);
    }
    // end loop for lecture time
    // start loop for lecture name
    var getLecName = document.getElementsByClassName('name');
    for (var name in getLecName) {
      lecNameList.add(name.text);
    }
    // end loop for lecture name
    // start loop for techer name
    var getTeacherName = document.getElementsByClassName('prep');
    for (var teacherdiv in getTeacherName) {
      var teacherli = teacherdiv.getElementsByTagName('li');
      for (var teacher in teacherli) {
        teacherNameAndGroupList.add(teacher.text);
      }
    }

    var number = 0;
    for (var i = number; i < teacherNameAndGroupList.length; i++) {
      if (i % 2 == 0) {
        teacherNameList.add(teacherNameAndGroupList[i]);
      } else {
        groupList.add(teacherNameAndGroupList[i]);
      }
    }

    forday2 = day1Lec.length;
    forday3 = day1Lec.length + day2Lec.length;
    forday4 = day1Lec.length + day2Lec.length + day3Lec.length;
    forday5 = day1Lec.length + day2Lec.length + day3Lec.length + day4Lec.length;
    forday6 = day1Lec.length +
        day2Lec.length +
        day3Lec.length +
        day4Lec.length +
        day5Lec.length;
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
          widget.name,
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
                              style: theme.textTheme.bodyText1,
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
                            style: theme.textTheme.bodyText1,
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
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: day1Lec.length,
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
                                                '${lecNoList[index]} ${lecTypeList[index]} ${lecCabList[index]}',
                                              ),
                                              // №. пара комната №
                                              Text(
                                                '${lecTimeList[index]}',
                                              ),
                                              // время
                                            ],
                                          ),
                                          Text(
                                            '${lecNameList[index]}',
                                          ),
                                          // subject name
                                          Text(
                                            '${teacherNameList[index]}${groupList[index]}',
                                          ),
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
                                  '${dayList[1]}',
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: day2Lec.length,
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
                                                '${lecNoList[forday2 + index]} ${lecTypeList[forday2 + index]} ${lecCabList[forday2 + index]}',
                                              ),
                                              // №. пара комната №
                                              Text(
                                                '${lecTimeList[forday2 + index]}',
                                              ),
                                              // время
                                            ],
                                          ),
                                          Text(
                                            '${lecNameList[forday2 + index]}',
                                          ),
                                          // subject name
                                          Text(
                                            '${teacherNameList[forday2 + index]}${groupList[forday2 + index]}',
                                          ),
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
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: day3Lec.length,
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
                                                '${lecNoList[forday3 + index]} ${lecTypeList[forday3 + index]} ${lecCabList[forday3 + index]}',
                                              ),
                                              // №. пара комната №
                                              Text(
                                                '${lecTimeList[forday3 + index]}',
                                              ),
                                              // время
                                            ],
                                          ),
                                          Text(
                                            '${lecNameList[forday3 + index]}',
                                          ),
                                          // subject name
                                          Text(
                                            '${teacherNameList[forday3 + index]}${groupList[forday3 + index]}',
                                          ),
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
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: day4Lec.length,
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
                                                '${lecNoList[forday4 + index]} ${lecTypeList[forday4 + index]} ${lecCabList[forday4 + index]}',
                                              ),
                                              // №. пара комната №
                                              Text(
                                                '${lecTimeList[forday4 + index]}',
                                              ),
                                              // время
                                            ],
                                          ),
                                          Text(
                                            '${lecNameList[forday4 + index]}',
                                          ),
                                          // subject name
                                          Text(
                                            '${teacherNameList[forday4 + index]}${groupList[forday4 + index]}',
                                          ),
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
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: day5Lec.length,
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
                                                '${lecNoList[forday5 + index]} ${lecTypeList[forday5 + index]} ${lecCabList[forday5 + index]}',
                                              ),
                                              // №. пара комната №
                                              Text(
                                                '${lecTimeList[forday5 + index]}',
                                              ),
                                              // время
                                            ],
                                          ),
                                          Text(
                                            '${lecNameList[forday5 + index]}',
                                          ),
                                          // subject name
                                          Text(
                                            '${teacherNameList[forday5 + index]}${groupList[forday5 + index]}',
                                          ),
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
                                  style: theme.textTheme.bodyText2,
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: day6Lec.length,
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
                                                '${lecNoList[forday6 + index]} ${lecTypeList[forday6 + index]} ${lecCabList[forday6 + index]}',
                                              ),
                                              // №. пара комната №
                                              Text(
                                                '${lecTimeList[forday6 + index]}',
                                              ),
                                              // время
                                            ],
                                          ),
                                          Text(
                                            '${lecNameList[forday6 + index]}',
                                          ),
                                          // subject name
                                          Text(
                                            '${teacherNameList[forday6 + index]}${groupList[forday6 + index]}',
                                          ),
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
              ),
              if (banner == null)
                SizedBox(height: 50)
              else
                Container(
                  height: 55,
                  child: AdWidget(
                    ad: banner,
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
