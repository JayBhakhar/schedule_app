import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/main.dart';
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
                color: AppColors.PRIMARY_COLOR,
              ),
              SizedBox(
                height: 5,
              ),
              ColorPicker(
                color: AppColors.PRIMARY_COLOR,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    AppColors.PRIMARY_COLOR = value;
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
                        AppColors.PRIMARY_COLOR = Color(0xFF2a5abe);
                        // AppColors.DIVIDER_COLOR1 =
                        //     Color.fromRGBO(0, 120, 250, 0.76);
                      });
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
                      color: AppColors.PRIMARY_COLOR,
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
