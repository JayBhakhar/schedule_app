import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:schedule_app/schedule_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupsList extends StatefulWidget {
  Map<String, String> groupMap = Map();
  GroupsList({this.groupMap});
  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  String body = '';
  String group_id;
  String group_name;

  Future<void> _saveGroupID() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('body', body);
    await prefs.setString('groupID', group_id);
    await prefs.setString('groupName', group_name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.0,right: 6.0),
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.groupMap.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 80.0,
          mainAxisExtent: 40,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding:  EdgeInsets.all(1.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87,
                  )
              ),
              child: GestureDetector(
                onTap: () async {
                  final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
                  var json = {'type': '2', 'id': widget.groupMap.keys.toList()[index], 'week': '0'};
                  // type = 1 for teacher
                  // type = 2 for student
                  // type = 3 for room no
                  Response response = await post(url, body: json);
                  // check the status code for the result
                  // int statusCode = response.statusCode;
                  setState(() {
                    body = response.body;
                    group_id = widget.groupMap.keys.toList()[index];
                    group_name = widget.groupMap.values.toList()[index];
                  });
                  _saveGroupID();
                  // print(widget.groupMap.keys.toList()[index]);
                  // print(widget.groupMap.values.toList()[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ScheduleTable(
                          groupId : widget.groupMap.keys.toList()[index],
                          group_name : widget.groupMap.values.toList()[index],
                          body : body,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      widget.groupMap.values.toList()[index],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}