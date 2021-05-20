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


List filoGroup = ['ИН11','ИН12','МФО11','РО11','ИН21','ИН22','РО21',
                  'РО21','СПРО21','СПИН31','ИН32','РО31'
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int facultyNo;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Table',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Расписание СФ БашГУ')),
        ),
        body: Column(
          children: [
            ListView.builder(
                itemCount: faculty.length,
                itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Center(child: Text('${faculty[index]}'),),
                onTap: (){
                  // show groupo list
                  print(index);
                  setState(() {
                    facultyNo = index;
                  });
                },
              );
            }),
            Builder(builder: (context) {
              if (facultyNo == 0)
                // return Text('$facultyNo is 1');
                return GridView.count(
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  crossAxisCount: 4,
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    ]);
              else
                return Container(
                  width: 0,
                  height: 0,
                );
            }),
          ],
        ),
      ),
    );
  }
}

// class Group extends StatelessWidget {
//   Group({this.facultyNo});
//   int facultyNo;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text('$facultyNo'),
//       ),
//     );
//   }
// }
