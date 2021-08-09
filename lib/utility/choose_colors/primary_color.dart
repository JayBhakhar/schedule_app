import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/home.dart';
import 'package:schedule_app/utility/Appcolors.dart';

class PrimaryColor extends StatefulWidget {
  @override
  _PrimaryColorState createState() => _PrimaryColorState();
}

class _PrimaryColorState extends State<PrimaryColor> {
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
                color: AppColors.DIVIDER_COLOR1,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.DIVIDER_COLOR1,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    AppColors.DIVIDER_COLOR1 = value;
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
                        AppColors.DIVIDER_COLOR1 = Color(0xFF2a5abe96);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Home(),
                          ),
                        );
                      },
                      child: Text('defult')),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Home(),
                          ),
                        );
                      },
                      child: Text('select')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
