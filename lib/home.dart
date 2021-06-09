import 'package:flutter/material.dart';
import 'package:schedule_app/lists.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:xml2json/xml2json.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int faculty_id;
  int facultyIndex;
  int groupIndex;
  final Xml2Json xml2Json = Xml2Json();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: faculty.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Center(
                    child: Text(
                      '${faculty[index]}',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onTap: () async {
                    setState(() {
                      facultyIndex = index;
                      if(facultyIndex == 0){
                        setState(() {
                          faculty_id = 4;
                        });
                      }
                      else if(facultyIndex == 1){
                        setState(() {
                          faculty_id = 5;
                        });
                      }
                      else if(facultyIndex == 2){
                        setState(() {
                          faculty_id = 6;
                        });
                      }
                      else if(facultyIndex == 3){
                        setState(() {
                          faculty_id = 7;
                        });
                      }
                      else if(facultyIndex == 4){
                        setState(() {
                          faculty_id = 8;
                        });
                      }
                      else if(facultyIndex == 5){
                        setState(() {
                          faculty_id = 9;
                        });
                      }
                      else if(facultyIndex == 6){
                        setState(() {
                          faculty_id = 10;
                        });
                      }
                      else if(facultyIndex == 7){
                        setState(() {
                          faculty_id = 18;
                        });
                      }
                      else if(facultyIndex == 8){
                        setState(() {
                          faculty_id = 26;
                        });
                      }
                      else if(facultyIndex == 9){
                        setState(() {
                          faculty_id = 27;
                        });
                      }
                      else if(facultyIndex == 10){
                        setState(() {
                          faculty_id = 127;
                        });
                      }
                    });
                    final url =
                    Uri.parse('http://edu.strbsu.ru/php/getList.php?faculty=$faculty_id');
                    Map<String, String> headers = {
                      "Content-type": "application/json"
                    };
                    Response response =
                    await get(url, headers: headers);
                    // check the status code for the result
                    int statusCode = response.statusCode;
                    var document = parse(response.body);
                    var body = response.body;
                    // print(body);
                    var ul = document.getElementsByTagName('ul');
                    // print(ul);
                    var a0 = ul[0].getElementsByTagName('a');
                    var texta = a0[0].innerHtml;
                    var a = document.getElementsByTagName('a');
                    var lena = document.getElementsByTagName('a').length;
                    // print(a0);
                    print(a);
                    print(lena);
                    print(texta);
                    for(var b in a0){
                      print('loop print $b');
                    }
                    // print(a0[0].innerHtml);
                    // print(a0[0].attributes['onclick']);
                    print(statusCode);
                  },
                  // onTap: () async {
                  //   final url =
                  //       Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
                  //   var json = {'type': '2','id': '26','week': '0'};
                  //   Response response =
                  //       await post(url, body:json);
                  //   // check the status code for the result
                  //   int statusCode = response.statusCode;
                  //   var body = response.body;
                  //   print(body);
                  //   print(statusCode);
                  //   setState(() {
                  //     facultyIndex = index;
                  //   });
                  // },
                );
              }),
          Builder(builder: (context) {
            if (facultyIndex == 0)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: philology.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            philology[index],
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
            else if (facultyIndex == 1)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: bashkir.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            bashkir[index],
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
            else if (facultyIndex == 2)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: history.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            history[index],
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
            else if (facultyIndex == 3)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: fmit.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            fmit[index],
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
            else if (facultyIndex == 4)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: science.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            science[index],
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
            else if (facultyIndex == 5)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: pip.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            pip[index],
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
            else if (facultyIndex == 6)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: ecomony.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            ecomony[index],
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
            else if (facultyIndex == 7)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: law.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            law[index],
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
            else if (facultyIndex == 8)
              return GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: collage.length,
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
                      onTap: () {
                        // go to next sceen for schdule
                        print('group' + '$index');
                        setState(() {
                          groupIndex = index;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            collage[index],
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
            else
              return Container(
                width: 0,
                height: 0,
              );
          }),
          Builder(builder: (context) {
            if (facultyIndex == 0 && groupIndex == 0) {
              return Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.green),
                    children: [
                      Center(
                        child: Text(
                          'Понедельник  date......',
                          style: TextStyle(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(children: [
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
            } else {
              return Container(
                width: 0,
                height: 0,
              );
            }
          }),
        ],
      ),
    );
  }
}
