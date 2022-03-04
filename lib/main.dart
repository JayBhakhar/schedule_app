import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/ads/ad_state.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schedule_app/get_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  await GetStorage.init();
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  int primaryColor;
  int cardColor;
  int textPrimaryColor;
  int textCardColor;

  @override
  void initState() {
    super.initState();
    getcolors();
  }

  Future<void> getcolors() async {
    final box = GetStorage();
    setState(() {
      primaryColor = box.read("primaryColor");
      cardColor = box.read("cardColor");
      textPrimaryColor = box.read("textPrimaryColor");
      textCardColor = box.read("textCardColor");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      getPages: getPagesList,
      initialRoute: '/home',
    );
  }
}

