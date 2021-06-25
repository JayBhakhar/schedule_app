import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> lettersList = [];
  List<String> lettersId = [];
  Map<String, String> letterMap = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextButton(
            onPressed: () async {
              final url = Uri.parse(
                  'http://edu.strbsu.ru/php/getList.php?prepList=1');
              // Response response = await post(url, body: json);
              Response response = await get(url);
              // check the status code for the result
              // int statusCode = response.statusCode;
              var document = parse(response.body);
              setState(() {
                lettersList = [];
                lettersId = [];
                letterMap = Map();
              });
              // start for loop day and date
              var letters = document.getElementsByTagName('div');
              for (var letter in letters) {
                var letID = letter.attributes['onclick'];
                var numberletID = letID.replaceAll(RegExp('[^0-9]'), '');
                lettersList.add(letter.text);
                lettersId.add(numberletID);
              } // end for loop for day
              letterMap = Map.fromIterables(lettersId, lettersList);
              // print(lettersId);
              // print(lettersList);
            },
            child: Text('Test'),
          ),
          Column(
            children: [
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: letterMap.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 60.0,
                    mainAxisExtent: 30,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () async {
                        final url = Uri.parse(
                            'http://edu.strbsu.ru/php/getList.php?letter=${letterMap.keys.toList()[index]}');
                        Response response = await get(url);
                        // int statusCode = response.statusCode;
                        var document = parse(response.body);
                        print(response.body);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black87,
                            )
                        ),
                        margin: EdgeInsets.only(top: 1.5),
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                          child: Center(
                            child: Text(
                              lettersList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
