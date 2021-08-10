import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:schedule_app/schedule_table.dart';
import 'package:schedule_app/utility/Appcolors.dart';
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

  Future<void> _saveGroupData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Type', 2);
    await prefs.setString('ID', group_id);
    await prefs.setString('Name', group_name);
    await prefs.setString('Body', body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.0, right: 6.0),
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
            padding: EdgeInsets.all(0.5),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  color: Theme.of(context).cardColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () async {
                  final url =
                      Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
                  var json = {
                    'type': '2',
                    'id': widget.groupMap.keys.toList()[index],
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
                    group_id = widget.groupMap.keys.toList()[index];
                    group_name = widget.groupMap.values.toList()[index];
                  });
                  _saveGroupData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ScheduleTable(
                          type: 2,
                          Id: widget.groupMap.keys.toList()[index],
                          Name: widget.groupMap.values.toList()[index],
                          body: body,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      widget.groupMap.values.toList()[index],
                      style: Theme.of(context).textTheme.bodyText2,
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
