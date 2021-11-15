import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:schedule_app/schedule_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupsList extends StatefulWidget {
  final List groupMapList;
  GroupsList({
    this.groupMapList,
  });

  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  String groupId;
  String groupName;
  var body;

  Future<void> _saveGroupData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Type', 2);
    await prefs.setString('ID', groupId);
    await prefs.setString('Name', groupName);
    await prefs.setString('Body', body);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.groupMapList.length);
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.groupMapList.length,
        itemBuilder: (context, int index1) {
          return Container(
            margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
            child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.groupMapList[index1].length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                mainAxisExtent: 40,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: EdgeInsets.all(1.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      border: Border.all(
                        color: theme.cardColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                      child: Container(
                        child: Center(
                          child: Text(
                            widget.groupMapList[index1].values.toList()[index],
                            style: theme.textTheme.bodyText1,
                          ),
                        ),
                      ),
                      onTap: () async {
                        print(widget.groupMapList[index1].keys.toList()[index]);
                        print(
                            widget.groupMapList[index1].values.toList()[index]);
                        final url = Uri.parse(
                            'http://edu.strbsu.ru/php/getShedule.php');
                        var json = {
                          'type': '2',
                          'id':
                              widget.groupMapList[index1].keys.toList()[index],
                          'week': '0'
                        };
                        // type = 1 for teacher
                        // type = 2 for student
                        // type = 3 for room no
                        Response response = await post(url, body: json);
                        // check the status code for the result
                        int statusCode = response.statusCode;
                        if (statusCode == 200) {
                          setState(() {
                            body = response.body;
                            groupId = widget.groupMapList[index1].keys
                                .toList()[index];
                            groupName = widget.groupMapList[index1].values
                                .toList()[index];
                          });
                          _saveGroupData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ScheduleTable(
                                  type: 2,
                                  id: widget.groupMapList[index1].keys
                                      .toList()[index],
                                  name: widget.groupMapList[index1].values
                                      .toList()[index],
                                  body: body,
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


      

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:schedule_app/schedule_table.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // ignore: must_be_immutable
// class GroupsList extends StatefulWidget {
//   List groupMapList = [];
//   Map<String, String> groupMap = Map();
//   GroupsList({
//     this.groupMap,
//     this.groupMapList,
//   });
//   @override
//   _GroupsListState createState() => _GroupsListState();
// }

// class _GroupsListState extends State<GroupsList> {
//   String body = '';
//   String groupId;
//   String groupName;

//   Future<void> _saveGroupData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('Type', 2);
//     await prefs.setString('ID', groupId);
//     await prefs.setString('Name', groupName);
//     await prefs.setString('Body', body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 6.0, right: 6.0),
//       child: GridView.builder(
//         physics: ScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: widget.groupMap.length,
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 80.0,
//           mainAxisExtent: 40,
//           crossAxisSpacing: 4.0,
//           mainAxisSpacing: 4.0,
//         ),
//         itemBuilder: (BuildContext context, index) {
//           return Padding(
//             padding: EdgeInsets.all(0.5),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: theme.primaryColor,
//                 border: Border.all(
//                   color: theme.cardColor,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: GestureDetector(
//                 onTap: () async {
//                   final url =
//                       Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
//                   var json = {
//                     'type': '2',
//                     'id': widget.groupMap.keys.toList()[index],
//                     'week': '0'
//                   };
//                   // type = 1 for teacher
//                   // type = 2 for student
//                   // type = 3 for room no
//                   Response response = await post(url, body: json);
//                   // check the status code for the result
//                   // int statusCode = response.statusCode;
//                   setState(() {
//                     body = response.body;
//                     groupId = widget.groupMap.keys.toList()[index];
//                     groupName = widget.groupMap.values.toList()[index];
//                   });
//                   _saveGroupData();
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ScheduleTable(
//                           type: 2,
//                           id: widget.groupMap.keys.toList()[index],
//                           name: widget.groupMap.values.toList()[index],
//                           body: body,
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 child: Container(
//                   child: Center(
//                     child: Text(
//                       widget.groupMap.values.toList()[index],
//                       style: theme.textTheme.bodyText1,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

