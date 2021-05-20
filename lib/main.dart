import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}
List faculty = [
  'Филологический факультет',
  'Факультет башкирской и тюркской филологии',
  'Исторический факультет',
  'Факультет математики и информационных технологий',
  'Естественнонаучный факультет',
  'Факультет педагогики и психологии',
  'Экономический факультет',
  'Юридический факультет',
  'Колледж'
];

List filoGroup = ['ИНФ11',
                  'ИНФ31',
                  'ZИНФ11'
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Расписание СФ БашГУ')),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: faculty.length,
                    itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Center(child: Text('${faculty[index]}'),),
                    onTap: (){
                      print(index);
                      // SHOW A GROUP LIST
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Group(facultyNo: index)
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Group extends StatelessWidget {
  Group({this.facultyNo});
  int facultyNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('$facultyNo'),
      ),
    );
  }
}
