import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:schedule_app/home.dart';
import 'package:schedule_app/schedule_table.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  @override
  void initState() {
    super.initState();
    _makePath();
  }

  void _makePath() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('groupID'));
    if (prefs.getString('groupID') == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    } else {
      Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => ScheduleTable(
            groupId: prefs.getString('groupID'),
            group_name: prefs.getString('groupName'),
            body: prefs.getString('body'),
          ),
        ),
      );
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png",
            height: 64.0, fit: BoxFit.fitHeight),
      ),
    );
  }
}
