import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:schedule_app/home.dart';
import 'package:schedule_app/room/room_schedule_table.dart';
import 'package:schedule_app/utility/ProgressIndicatorLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomsList extends StatefulWidget {
  @override
  _RoomsListState createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {
  List<String> buildingsList = [];
  List<String> buildingsId = [];
  Map<String, String> buildingMap = Map();
  List<String> roomsList = [];
  List<String> roomsId = [];
  Map<String, String> roomMap = Map();
  String body = '';
  String room_id;
  String room_name;

  Future<void> _saveRoomID() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Type', 3);
    await prefs.setString('Room_ID', room_id);
    await prefs.setString('Room_Name', room_name);
    await prefs.setString('Body', body);
  }

  @override
  initState() {
    _getbuilding();
  }

  Future<void> _getbuilding() async {
    final url = Uri.parse('http://edu.strbsu.ru/php/getList.php?korpuses=1');
    // Response response = await post(url, body: json);
    Response response = await get(url);
    // check the status code for the result
    // int statusCode = response.statusCode;
    var document = parse(response.body);
    setState(() {
      buildingsList = [];
      buildingsId = [];
      buildingMap = Map();
    });
    var rooms = document.getElementsByClassName('prep_name');
    for (var room in rooms) {
      var roomId = room.attributes['onclick'];
      var numberletID = roomId.replaceAll(RegExp('[^0-9]'), '');
      buildingsList.add(room.text);
      buildingsId.add(numberletID);
    }
    buildingMap = Map.fromIterables(buildingsId, buildingsList);
  }

  @override
  Widget build(BuildContext context) {
    if (Home.of(context).scrollController.hasClients) {
      Home.of(context).scrollController.animateTo(
            Home.of(context).scrollController.position.maxScrollExtent ==
                    1.409090909090878
                ? 550
                : Home.of(context).scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
    }
    bool isLoading = false;
    return Container(
      margin: EdgeInsets.only(left: 6.0, right: 6.0),
      child: Stack(children: [
        Column(
          children: [
            GridView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: buildingMap.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150.0,
                  mainAxisExtent: 35,
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
                          'http://edu.strbsu.ru/php/getList.php?korpus=${buildingMap.keys.toList()[index]}');
                      Response response = await get(url);
                      // int statusCode = response.statusCode;
                      setState(() {
                        isLoading = false;
                      });
                      var document = parse(response.body);
                      setState(() {
                        roomsList = [];
                        roomsId = [];
                        roomMap = Map();
                      });
                      // start for loop for teacherName
                      var roomNumbers =
                          document.getElementsByClassName('prep_name');
                      for (var roomNumber in roomNumbers) {
                        var roomNumberIDAttribute =
                            roomNumber.attributes['onclick'];
                        var teaNameIDstr = roomNumberIDAttribute.replaceAll(
                            RegExp('[^0-9]'), '');
                        var teaNameID =
                            teaNameIDstr.substring(2, teaNameIDstr.length - 1);
                        roomsList.add(roomNumber.text);
                        roomsId.add(teaNameID);
                      } // end for loop for teacherName
                      roomMap = Map.fromIterables(roomsId, roomsList);
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
                            buildingsList[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2,
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
              itemCount: roomMap.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 90.0,
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
                      'type': '3',
                      'id': roomMap.keys.toList()[index],
                      'week': '0'
                    };
                    // type = 1 for teacher
                    // type = 2 for student
                    // type = 3 for room no
                    Response response = await post(url, body: json);
                    // check the status code for the result
                    // int statusCode = response.statusCode;
                    setState(() {
                      body = response.body;
                      room_id = roomMap.keys.toList()[index];
                      room_name = roomMap.values.toList()[index];
                    });
                    _saveRoomID();
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RoomScheduleTable(
                            type: 3,
                            Id: roomMap.keys.toList()[index],
                            Name: roomMap.values.toList()[index],
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
                          roomsList[index],
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
