import 'package:dynamic_theme/dynamic_theme.dart';
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
    // return MaterialApp(
    //   title: 'Time Table',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blueGrey,
    //   ),
    //   home: LoadingScreen(),
    //   routes: {
    //     ScheduleTable.id: (context) => ScheduleTable()
    //   },
    // );
    return DynamicTheme(
      defaultBrightness: isDark ? Brightness.dark : Brightness.light,
      data: (brightness) => _buildTheme(brightness),
      themedWidgetBuilder: (context, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: LoadingScreen(),
        routes: {
          ScheduleTable.id: (context) => ScheduleTable(),
          LoadingScreen.id: (context) => LoadingScreen(),
        },
        // home: SyncLinkDashView(),
      ),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    return brightness == Brightness.dark
        ? ThemeData.dark().copyWith(
            // textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'open-sens'),
            primaryColor: AppColors.PrimaryColorDark,
            backgroundColor: AppColors.WHITECOLOR,
            scaffoldBackgroundColor: AppColors.WHITECOLOR,
            cardColor: AppColors.Primarygreen1,
            primaryTextTheme: Typography().white,
            textTheme: Typography().black,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
          )
        : ThemeData.light().copyWith(
            // textTheme: ThemeData.light().textTheme.apply(fontFamily: 'open-sens'),
            primaryColor: AppColors.PrimaryColorLight,
            scaffoldBackgroundColor: AppColors.WHITECOLOR,
            cardColor: Colors.blueGrey[100],
            // scaffoldBackgroundColor: AppColors.WHITECOLOR,
          );
  }
}
