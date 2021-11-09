import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app/ads/ad_state.dart';
import 'package:schedule_app/main.dart';
import 'package:schedule_app/utility/Appcolors.dart';
import 'package:schedule_app/utility/choose_colors/card_color.dart';
import 'package:schedule_app/utility/choose_colors/primary_color.dart';
import 'package:schedule_app/utility/choose_colors/text_primary_color.dart';
import 'package:schedule_app/utility/choose_colors/text_card_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseColorsScreen extends StatefulWidget {
  @override
  _ChooseColorsScreenState createState() => _ChooseColorsScreenState();
}

class _ChooseColorsScreenState extends State<ChooseColorsScreen> {
  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      banner = BannerAd(
        adUnitId: adState.bannerAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: adState.listener,
      )..load();
    });
  }

  int primaryColor = AppColors.PRIMARY_COLOR;
  int cardColor = AppColors.CARD_COLOR;
  int textPrimaryColor = AppColors.CARD_COLOR;
  int textCardColor = AppColors.CARD_COLOR;

  @override
  initState() {
    super.initState();
    getSharedPreferenceObject();
  }

  Future<void> getSharedPreferenceObject() async {
    final prefs = await SharedPreferences.getInstance();
    primaryColor = prefs.getInt("primaryColor");
    cardColor = prefs.getInt("cardColor");
    textPrimaryColor = prefs.getInt("textPrimaryColor");
    textCardColor = prefs.getInt("textCardColor");
  }

  _allDefaultColors() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("primaryColor");
    prefs.remove("cardColor");
    prefs.remove("textPrimaryColor");
    prefs.remove("textCardColor");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 2,
                ),
                ListTile(
                  tileColor: theme.primaryColor,
                  title: Text(
                    'Выбрать основной цвет',
                    style: theme.textTheme.bodyText1,
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
                  tileColor: theme.cardColor,
                  title: Text(
                    'Выбрать цвет карточки',
                    style: theme.textTheme.bodyText2,
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
                  tileColor: theme.primaryColor,
                  title: Text(
                    'Выбрать основной цвет текста',
                    style: theme.textTheme.bodyText1,
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
                  tileColor: theme.cardColor,
                  title: Text(
                    'Выбрать цвет текста карточки',
                    style: theme.textTheme.bodyText2,
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
                        _allDefaultColors();
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
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        // color: Colors.cyanAccent,
                        width: 130,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Сбросить цвета',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 385,
                ),
                if (banner == null)
                  SizedBox(height: 50)
                else
                  Container(
                    height: 55,
                    child: AdWidget(
                      ad: banner,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
