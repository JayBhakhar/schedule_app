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
  // int primaryColor = AppColors.PRIMARY_COLOR;
  int primaryColor;
  int cardColor;
  int textPrimaryColor;
  int textCardColor;

  @override
  initState() {
    // _remove_all_color();
    getSharedPreferenceObject();
    super.initState();
  }

  _remove_all_color() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("primaryColor");
    prefs.remove("cardColor");
    prefs.remove("textPrimrayColor");
    prefs.remove("textCardColor");
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      primaryColor = prefs.getInt("primaryColor");
      cardColor = prefs.getInt("cardColor");
      textPrimaryColor = prefs.getInt("textPrimaryColor");
      textCardColor = prefs.getInt("textCardColor");
    });
    print('primary $primaryColor');
    print('card $cardColor');
    print('text primary $textPrimaryColor');
    print('text card $textCardColor');
  }

  @override
  Widget build(BuildContext context) {
    // print('built primary ${Color(primaryColor)}');
    // print('built card ${Color(cardColor)}');
    // print('built text primary ${Color(textPrimaryColor)}');
    // print('built text card ${Color(textCardColor)}');
    return MaterialApp(
      title: 'Расписание СФ БашГУ',
      theme: ThemeData(
        primaryColor:
            primaryColor == null ? Color(0xFF2a5abe) : Color(primaryColor),
        cardColor: cardColor == null ? Color(0xFFDEEDCE) : Color(cardColor),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: textPrimaryColor == null
                ? Colors.black
                : Color(textPrimaryColor),
          ),
          bodyText2: TextStyle(
            color: textCardColor == null ? Colors.white : Color(textCardColor),
          ),
        ),
      ),
      home: LoadingScreen(),
      routes: {ScheduleTable.id: (context) => ScheduleTable()},
    );
  }
}
