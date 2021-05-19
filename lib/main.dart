import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            children: [
              GestureDetector(
                onTap: (){
                  print('vasyuhvljh');
                },
                child: Column(
                  children: List.generate(faculty.length,(index){
    return Text(faculty[index].toString());})
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

