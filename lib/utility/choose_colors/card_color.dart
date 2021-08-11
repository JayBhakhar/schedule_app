import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardColor extends StatefulWidget {
  @override
  _CardColorState createState() => _CardColorState();
}

class _CardColorState extends State<CardColor> {
  int textPrimaryColor = AppColors.CARD_COLOR;

  @override
  initState() {
    getSharedPreferenceObject();
    super.initState();
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      textPrimaryColor = prefs.getInt("textPrimaryColor");
    });
  }

  _selectedValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("cardColor", AppColors.CARD_COLOR1.value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 360,
                color: AppColors.CARD_COLOR1,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.CARD_COLOR1,
                onChanged: (value) {
                  setState(() {
                    AppColors.CARD_COLOR1 = value;
                  });
                },
                initialPicker: Picker.paletteHue,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove("cardColor");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return App();
                            },
                          ),
                        );
                      });
                    },
                    child: Container(
                      color: Color(0xFFDEEDCE),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Default',
                          style: TextStyle(
                            color: textPrimaryColor == null
                                ? Colors.black
                                : Color(textPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _selectedValue();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => App(),
                        ),
                      );
                    },
                    child: Container(
                      color: AppColors.CARD_COLOR1,
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: textPrimaryColor == null
                                ? Colors.black
                                : Color(textPrimaryColor),
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
