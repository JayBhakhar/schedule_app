import 'package:flutter/material.dart';

class ScheduleTable extends StatefulWidget {
  static String id = 'schedule_table';
  String group_id;
  String group_name;
  var body;

  ScheduleTable({this.group_id, this.group_name, this.body});

  @override
  _ScheduleTableState createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group_name),
      ),
      body: Table(
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
      ),
    );
  }
}
