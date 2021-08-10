import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';

class TextPrimaryColor extends StatefulWidget {
  @override
  _TextPrimaryColorState createState() => _TextPrimaryColorState();
}

class _TextPrimaryColorState extends State<TextPrimaryColor> {
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
                color: AppColors.TEXT_CARD_COLOR,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.TEXT_CARD_COLOR,
                onChanged: (value) {
                  setState(() {
                    AppColors.TEXT_CARD_COLOR = value;
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
                        AppColors.TEXT_CARD_COLOR = Colors.black;
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
                            color: Colors.black,
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
                            color: AppColors.TEXT_CARD_COLOR,
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
