import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'groups_list.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int faculty_id = 7;
  var body = '';
  List<String> dayList = [];
  List<String> LecNoList = [];
  List<String> LecTypeList = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () async {
            final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
            var json = {'type': '2', 'id': '10173', 'week': '0'};
            Response response = await post(url, body: json);
            // check the status code for the result
            int statusCode = response.statusCode;
            var document = parse(response.body);
            setState(() {
              dayList = [];
              LecNoList = [];
              LecTypeList = [];
            });
            // start for loop day and date
            var getDay = document.getElementsByClassName('day');
            for (var days in getDay) {
              var daylist = days.getElementsByTagName('h2');
              for (var day in daylist) {
                dayList.add(day.innerHtml);
              }
            } // end for loop for day
            // start loop for lecture number
            var getLecNo = document.getElementsByClassName('number');
            for (var number in getLecNo) {
              LecNoList.add(number.innerHtml);
            } // end loop for lecture number
            // start loop for lecture number
            var getLecType = document.getElementsByClassName('type');
            for (var div1 in getLecType) {
              var div = div1.getElementsByTagName('div');
              for (var type in div) {
                LecTypeList.add(type.innerHtml);
              }
            } // end loop for lecture number
            print(response.body);
            print(LecTypeList);
            print(LecTypeList.length);
          },
          child: Text('Test'),
        ),
        Column(
          children: [
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: dayList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(
                      '${dayList[index]}',
                      style: TextStyle(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                }),
          ],
        ),
        Row(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('data'), // №. пара комната №
                  Text('data'), // время
                ],
              ),
              Text('data'), // subject name
              Text('data'), // teacher name
            ],
          )
        ])
      ],
    );
  }
}
