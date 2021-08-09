import 'package:flutter/material.dart';
import 'package:schedule_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    _makePath();
  }

  void _makePath() async {
    Future.delayed(
      Duration(seconds: 1),
    );
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
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
