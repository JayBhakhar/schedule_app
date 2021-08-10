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
  int primaryColor = AppColors.PRIMARY_COLOR1;

  @override
  initState() {
    getSharedPreferenceObject();
    super.initState();
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool("isDark");
      primaryColor = prefs.getInt("primayColor");
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(Color(primaryColor));
    print('sadsad ===  $primaryColor');
    // print(AppColors.PRIMARY_COLOR);
    return MaterialApp(
      title: 'Расписание СФ БашГУ',
      theme: ThemeData(
        primaryColor: AppColors.PRIMARY_COLOR,
        // primaryColor: Color(primaryColor),
        cardColor: AppColors.CARD_COLOR,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: AppColors.TEXT_PRIMARY_COLOR,
          ),
          bodyText2: TextStyle(
            color: AppColors.TEXT_CARD_COLOR,
          ),
        ),
      ),
      home: LoadingScreen(),
      routes: {ScheduleTable.id: (context) => ScheduleTable()},
    );
  }
}
