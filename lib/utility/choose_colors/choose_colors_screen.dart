import 'package:flutter/material.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:schedule_app/utility/choose_colors/card_color.dart';
import 'package:schedule_app/utility/choose_colors/primary_color.dart';
import 'package:schedule_app/utility/choose_colors/text_card_color.dart';
import 'package:schedule_app/utility/choose_colors/text_primary_color.dart';

class ChooseColors extends StatefulWidget {
  @override
  _ChooseColorsState createState() => _ChooseColorsState();
}

class _ChooseColorsState extends State<ChooseColors> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2,
              ),
              ListTile(
                tileColor: AppColors.PRIMARY_COLOR,
                title: Text(
                  'Choose Primary Color',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushReplacement(
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
                tileColor: AppColors.CARD_COLOR,
                title: Text(
                  'Choose Card Color',
                  style: Theme.of(context).textTheme.bodyText1,
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
                tileColor: AppColors.PRIMARY_COLOR,
                title: Text(
                  'Choose Primary Text Color',
                  style: Theme.of(context).textTheme.bodyText2,
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
                tileColor: AppColors.CARD_COLOR,
                title: Text(
                  'Choose Card Text Color',
                  style: Theme.of(context).textTheme.bodyText1,
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
                      setState(() {
                        AppColors.PRIMARY_COLOR = Color(0xFF2a5abe);
                        AppColors.CARD_COLOR = Color(0xFFDEEDCE);
                        AppColors.TEXT_CARD_COLOR = Colors.white;
                        AppColors.TEXT_PRIMARY_COLOR = Colors.black;
                      });
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
