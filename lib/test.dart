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
  List<String> groupList = [];
  List<String> group_id = [];
  Map<String, String> groupMap = Map();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () async {
            final url = Uri.parse(
                'http://edu.strbsu.ru/php/getList.php?faculty=$faculty_id');
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            // int statusCode = response.statusCode;
            var document = parse(response.body);
            var ul = document.getElementsByTagName('ul');
            for (var ullist in ul) {
              var alist = ullist.getElementsByTagName('a');
              for (var atext in alist) {
                groupList.add(atext.innerHtml);
                // print(atext.attributes['onclick']);
              }
            }
            for (var ullist in ul) {
              var divlist = ullist.getElementsByTagName('div');
              for (var atext in divlist) {
                group_id.add(atext.innerHtml);
              }
            }
            setState(() {
              body = response.body;
              groupMap =
                  Map.fromIterables(group_id, groupList);
            });
            // print(group_id);
            // print(groupList);
            // print(groupMap);
            var a0 = ul[0].getElementsByTagName('a');
            var a0len = ul[0].getElementsByTagName('a').length;
            var texta = a0[0].innerHtml;
            var a = document.getElementsByTagName('a');
            var lena = document.getElementsByTagName('a').length;
            // print(a0);
            // print(a0len);
            // print(a);
            // print(lena);
            // print(texta);
            // print(a0[0].attributes['onclick']);
            // print(a[2].attributes['onclick']);
            // print(statusCode);
            // print(body);
          },
          child: Text('Test'),
        ),
        TextButton(
          onPressed: () async {
            final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
            var json = {'type': '2', 'id': '10173', 'week': '-1'};
            Response response = await post(url, body: json);
            // check the status code for the result
            int statusCode = response.statusCode;
            setState(() {
              body = response.body;
            });
            setState(() {
              // facultyIndex = index;
            });
          },
          child: Text('Test 2'),
        ),
        // Html(
        //   data: body,
        //   style: {"a": Style(color: Colors.green)},
        // ),
        GroupsList(
          groupMap: groupMap,
        ),
      ],
    );
  }
}
