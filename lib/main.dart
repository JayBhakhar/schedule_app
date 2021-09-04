import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/ads/ad_state.dart';
import 'package:schedule_app/utility/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => App(),
    ),
  );
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
    super.initState();
    getSharedPreferenceObject();
  }

  // _remove_all_color() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove("primaryColor");
  //   prefs.remove("cardColor");
  //   prefs.remove("textPrimrayColor");
  //   prefs.remove("textCardColor");
  // }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      primaryColor = prefs.getInt("primaryColor");
      cardColor = prefs.getInt("cardColor");
      textPrimaryColor = prefs.getInt("textPrimaryColor");
      textCardColor = prefs.getInt("textCardColor");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Расписание СФ БашГУ',
      theme: ThemeData(
        primaryColor:
            primaryColor == null ? Color(0xFF2a5abe) : Color(primaryColor),
        cardColor: cardColor == null ? Color(0xFFDEEDCE) : Color(cardColor),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: textPrimaryColor == null
                ? Colors.white
                : Color(textPrimaryColor),
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: textCardColor == null ? Colors.black : Color(textCardColor),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
