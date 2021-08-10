import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
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
                color: AppColors.CARD_COLOR,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.CARD_COLOR,
                onChanged: (value) {
                  setState(() {
                    AppColors.CARD_COLOR = value;
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
                        AppColors.CARD_COLOR = Color(0xFFDEEDCE);
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
                            color: AppColors.TEXT_PRIMARY_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => App(),
                        ),
                      );
                    },
                    child: Container(
                      color: AppColors.CARD_COLOR,
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: AppColors.TEXT_PRIMARY_COLOR,
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
