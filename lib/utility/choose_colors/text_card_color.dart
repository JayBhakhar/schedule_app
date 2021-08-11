import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextCardColor extends StatefulWidget {
  @override
  _TextCardColorState createState() => _TextCardColorState();
}

class _TextCardColorState extends State<TextCardColor> {
  int textPrimaryColor;
  int cardColor;

  @override
  initState() {
    getSharedPreferenceObject();
    super.initState();
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      textPrimaryColor = prefs.getInt("textPrimaryColor");
      cardColor = prefs.getInt("cardColor");
    });
  }

  _selectedValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("textCardColor", AppColors.TEXT_CARD_COLOR1.value);
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
                color: AppColors.TEXT_PRIMARY_COLOR1,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.TEXT_PRIMARY_COLOR1,
                onChanged: (value) {
                  setState(() {
                    AppColors.TEXT_PRIMARY_COLOR1 = value;
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
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove("textCardColor");
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
                      color: AppColors.TEXT_PRIMARY_COLOR1,
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Default',
                          style: TextStyle(
                            color: cardColor == null
                                ? Color(0xFFDEEDCE)
                                : Color(cardColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      _selectedValue();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => App(),
                        ),
                      );
                    },
                    child: Container(
                      color: AppColors.TEXT_PRIMARY_COLOR1,
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
