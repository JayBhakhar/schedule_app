import 'package:schedule_app/home.dart';
import 'package:schedule_app/schedule_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/test.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
        body: Home(),
      ),
      routes: {
        ScheduleTable.id: (context) => ScheduleTable()
      },
    );
  }
}
