import 'package:flutter/material.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:schedule_app/utility/choose_colors/card_color.dart';
import 'package:schedule_app/utility/choose_colors/primary_color.dart';
import 'package:schedule_app/utility/choose_colors/text_primary_color.dart';
import 'package:schedule_app/utility/choose_colors/text_card_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseColorsScreen extends StatefulWidget {
  @override
  _ChooseColorsScreenState createState() => _ChooseColorsScreenState();
}

class _ChooseColorsScreenState extends State<ChooseColorsScreen> {
  int primaryColor = AppColors.PRIMARY_COLOR;
  int cardColor = AppColors.CARD_COLOR;
  int textPrimaryColor = AppColors.CARD_COLOR;
  int textCardColor = AppColors.CARD_COLOR;

  @override
  initState() {
    getSharedPreferenceObject();
    super.initState();
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    primaryColor = prefs.getInt("primaryColor");
    cardColor = prefs.getInt("cardColor");
    textPrimaryColor = prefs.getInt("textPrimaryColor");
    textCardColor = prefs.getInt("textCardColor");
  }

  _all_default_colors() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("primaryColor");
    prefs.remove("cardColor");
    prefs.remove("textPrimaryColor");
    prefs.remove("textCardColor");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2,
              ),
              ListTile(
                tileColor: theme.primaryColor,
                title: Text(
                  'Choose Primary Color',
                  style: theme.textTheme.bodyText1,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PrimaryColor();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2,
              ),
              ListTile(
                tileColor: theme.cardColor,
                title: Text(
                  'Choose Card Color',
                  style: theme.textTheme.bodyText2,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CardColor();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2,
              ),
              ListTile(
                tileColor: theme.primaryColor,
                title: Text(
                  'Choose Primary Text Color',
                  style: theme.textTheme.bodyText1,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TextPrimaryColor();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2,
              ),
              ListTile(
                tileColor: theme.cardColor,
                title: Text(
                  'Choose Card Text Color',
                  style: theme.textTheme.bodyText2,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TextCardColor();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _all_default_colors();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return App();
                          },
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.cyanAccent,
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'All Default',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
