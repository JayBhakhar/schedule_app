import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:schedule_app/lists.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int faculty_id = 9;
  var body = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () async {
            final url =
                Uri.parse('http://edu.strbsu.ru/php/getList.php?faculty=$faculty_id');
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            // check the status code for the result
            int statusCode = response.statusCode;
            var document = parse(response.body);
            setState(() {
              body = response.body;
            });
            // print(body);
            var ul = document.getElementsByTagName('ul');
            // print(ul);
            var a0 = ul[0].getElementsByTagName('a');
            var texta = a0[0].innerHtml;
            var a = document.getElementsByTagName('a');
            var lena = document.getElementsByTagName('a').length;
            // print(a0);
            // print(a);
            // print(lena);
            // print(texta);
            // for (var b in a0) {
            //   print('loop print $b');
            // }
            // print(a0[0].innerHtml);
            // print(a0[0].attributes['onclick']);
            print(statusCode);
            print(body);
          },
          child: Text('Test'),
        ),
        TextButton(
          onPressed: () async {
            final url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
            var json = {'type': '2', 'id': '10173', 'week': '0'};
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
          child: Text('Test 2'),),
        Html(data: body)
      ],
    );
  }
}
