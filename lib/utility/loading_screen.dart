import 'package:flutter/material.dart';
import 'package:schedule_app/home.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    _makePath();
    super.initState();
  }

  void _makePath() async {
    Future.delayed(
      Duration(seconds: 1),
    );
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
