import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrimaryColor extends StatefulWidget {
  @override
  _PrimaryColorState createState() => _PrimaryColorState();
}

class _PrimaryColorState extends State<PrimaryColor> {
  int textCardColor;
  @override
  void initState() {
    _getSharedObject();
    super.initState();
  }

  _getSharedObject() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      textCardColor = prefs.getInt("textCardColor");
    });
  }

  _selectedValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("primaryColor", AppColors.PRIMARY_COLOR1.value);
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
                color: AppColors.PRIMARY_COLOR1,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.PRIMARY_COLOR1,
                onChanged: (value) {
                  setState(() {
                    AppColors.PRIMARY_COLOR1 = value;
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
                      prefs.remove("primaryColor");
                      // AppColors.DIVIDER_COLOR1 =
                      //     Color.fromRGBO(0, 120, 250, 0.76);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => App(),
                        ),
                      );
                    },
                    child: Container(
                      color: Color(0xFF2a5abe),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Default',
                          style: TextStyle(
                            color: textCardColor == null
                                ? Colors.black
                                : Color(textCardColor),
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
                      color: AppColors.PRIMARY_COLOR1,
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: textCardColor == null
                                ? Colors.black
                                : Color(textCardColor),
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
