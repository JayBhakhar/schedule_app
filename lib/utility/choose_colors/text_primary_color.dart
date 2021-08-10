import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';

class TextCardColor extends StatefulWidget {
  @override
  _TextCardColorState createState() => _TextCardColorState();
}

class _TextCardColorState extends State<TextCardColor> {
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
                color: AppColors.TEXT_PRIMARY_COLOR,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.TEXT_PRIMARY_COLOR,
                onChanged: (value) {
                  setState(() {
                    AppColors.TEXT_PRIMARY_COLOR = value;
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
                        AppColors.TEXT_PRIMARY_COLOR = Colors.white;
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
                      color: AppColors.CARD_COLOR,
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Default',
                          style: TextStyle(
                            color: AppColors.TEXT_CARD_COLOR,
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
