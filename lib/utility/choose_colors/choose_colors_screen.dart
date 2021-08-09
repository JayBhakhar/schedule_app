import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:schedule_app/utility/choose_colors/card_color.dart';
import 'package:schedule_app/utility/choose_colors/primary_color.dart';
import 'package:schedule_app/utility/choose_colors/text_color.dart';

class ChooseColors extends StatefulWidget {
  Color color1;
  Color color2;
  @override
  _ChooseColorsState createState() => _ChooseColorsState();
}

class _ChooseColorsState extends State<ChooseColors> {
  @override
  void initState() {
    super.initState();
    widget.color1 = Colors.yellowAccent;
    widget.color2 = Colors.red[500];
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
                tileColor: Theme.of(context).primaryColor,
                title: Text(
                  'Choose Primary Color',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
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
                tileColor: Theme.of(context).cardColor,
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
                tileColor: Colors.amberAccent,
                title: Text(
                  'Choose Text Color',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TextColor();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
