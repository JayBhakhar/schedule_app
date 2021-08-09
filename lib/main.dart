import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:schedule_app/utility/loading_screen.dart';
import 'package:schedule_app/schedule_table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'test.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDark = false;

  @override
  initState() {
    getSharedPreferenceObject();
    super.initState();
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool("isDark");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Table',
      theme: ThemeData(
        primaryColor: AppColors.DIVIDER_COLOR1,
        cardColor: AppColors.DIVIDER_COLOR2,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: AppColors.DIVIDER_COLOR3,
            // color: Colors.red,
          ),
        ),
      ),
      home: LoadingScreen(),
      routes: {ScheduleTable.id: (context) => ScheduleTable()},
    );
  }
}
