import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GroupsList extends StatefulWidget {
  Map<String, String> groupMap = Map();
  GroupsList({this.groupMap});
  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  var body = '';
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () async {
              final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
              var json = {'type': '2', 'id': widget.groupMap.keys.toList()[index], 'week': '-1'};
              Response response = await post(url, body: json);
              // check the status code for the result
              int statusCode = response.statusCode;
              setState(() {
                body = response.body;
              });
              print(body);
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
        );
      },
    );
  }
}