import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/home.dart';
import 'package:schedule_app/utility/Appcolors.dart';

class CardColor extends StatefulWidget {
  @override
  _CardColorState createState() => _CardColorState();
}

class _CardColorState extends State<CardColor> {
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
                color: AppColors.DIVIDER_COLOR2,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.DIVIDER_COLOR2,
                onChanged: (value) {
                  setState(() {
                    AppColors.DIVIDER_COLOR2 = value;
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
                        setState(() {
                          AppColors.DIVIDER_COLOR2 = Color(0xFFDEEDCE);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ),
                          );
                        });
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
