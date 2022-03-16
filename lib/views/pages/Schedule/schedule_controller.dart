import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/parser.dart';
import 'package:schedule_app/service/api_provider.dart';
import 'package:schedule_app/utils/ad_helper.dart';

class ScheduleController extends GetxController {
  BannerAd adBanner;
  RxBool _isAdLoaded = false.obs;
  bool isLoading = false;
  dynamic data = Get.arguments;
  int week = 0;
  String schedule = '';
  List dayList = [];
  List lecNoList = [];
  List lecNoList2 = []; // for to set range of leture
  List lecTypeList = [];
  List lecCabList = [];
  List lecTimeList = [];
  List lecNameList = [];
  List teacherNameAndGroupList = [];
  List teacherNameList = [];
  List groupList = [];
  List day1Lec = [];
  List day2Lec = [];
  List day3Lec = [];
  List day4Lec = [];
  List day5Lec = [];
  List day6Lec = [];
  int forday2;
  int forday3;
  int forday4;
  int forday5;
  int forday6;

  @override
  void onInit() {
    super.onInit();
    ad();
    getSchedule(data['type'], data['id'], week);
    update();
  }

  void ad() {
    adBanner = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );
    adBanner.load();
  }

  void weekIncrease() {
    week++;
    clearAll();
    getSchedule(data['type'], data['id'], week);
  }

  void weekDecrease() {
    week--;
    clearAll();
    getSchedule(data['type'], data['id'], week);
  }

  void clearAll() {
    dayList = [];
    lecNoList = [];
    lecNoList2 = [];
    lecTypeList = [];
    lecCabList = [];
    lecTimeList = [];
    lecNameList = [];
    teacherNameAndGroupList = [];
    teacherNameList = [];
    groupList = [];
    day1Lec = [];
    day2Lec = [];
    day3Lec = [];
    day4Lec = [];
    day5Lec = [];
    day6Lec = [];
  }

  void getSchedule(String type, String id, int week) async {
    isLoading = true;
    update();
    var body = await ApiProvider().getSchedule(type, id, week);
    if (body != null) {
      schedule = body;
      // todo: save to getstorage
    }
    if (data['type'] == '3') {
      parsingData3();
    } else {
      parsingData();
    }
    isLoading = false;
    update();
  }

  void parsingData3() {
    var document = parse(schedule);
    var getDay = document.getElementsByClassName('day');
    for (var days in getDay) {
      var daylist = days.getElementsByTagName('h2');
      for (var day in daylist) {
        dayList.add(day.innerHtml);
      }
      var getLec = document.getElementsByClassName('lesson');
      for (var number in getLec) {
        if (number.text != '') {
          lecNoList.add(number.text[0] + number.text[1]);
        }
        lecNoList2.add(number.text);
      }

      var day1 = lecNoList2.getRange(0, 8);
      for (var i in day1) {
        if (i != '') {
          day1Lec.add(i);
        }
      }
      var day2 = lecNoList2.getRange(8, 16);
      for (var i in day2) {
        if (i != '') {
          day2Lec.add(i);
        }
      }
      var day3 = lecNoList2.getRange(16, 24);
      for (var i in day3) {
        if (i != '') {
          day3Lec.add(i);
        }
      }
      var day4 = lecNoList2.getRange(24, 32);
      for (var i in day4) {
        if (i != '') {
          day4Lec.add(i);
        }
      }
      var day5 = lecNoList2.getRange(32, 40);
      for (var i in day5) {
        if (i != '') {
          day5Lec.add(i);
        }
      }
      var day6 = lecNoList2.getRange(40, 48);
      for (var i in day6) {
        if (i != '') {
          day6Lec.add(i);
        }
      }
      // end loop for lecture number
      // start loop for lecture type
      var getLecType = document.getElementsByClassName('type');
      for (var div1 in getLecType) {
        String lecType = div1.text;
        List a = lecType.split(RegExp(r"[0-9]"));
        lecTypeList.add(a.last);
      }
      // end loop for lecture type
      // start loop for lecture cabinate
      var getLecCab = document.getElementsByClassName('cab');
      for (var cab in getLecCab) {
        lecCabList.add(cab.text);
      }
      // end loop for lecture cabinate
      // start loop for lecture time
      var getLecTime = document.getElementsByClassName('time');
      for (var time in getLecTime) {
        lecTimeList.add(time.text);
      }
      // end loop for lecture time
      // start loop for lecture name
      var getLecName = document.getElementsByClassName('name');
      for (var name in getLecName) {
        lecNameList.add(name.text);
      }
      // end loop for lecture name
      // start loop for techer name
      var getTeacherName = document.getElementsByClassName('prep');
      for (var teacherdiv in getTeacherName) {
        var teacherli = teacherdiv.getElementsByTagName('li');
        for (var teacher in teacherli) {
          teacherNameAndGroupList.add(teacher.text);
        }
      }

      var number = 0;
      for (var i = number; i < teacherNameAndGroupList.length; i++) {
        if (i % 2 == 0) {
          teacherNameList.add(teacherNameAndGroupList[i]);
        } else {
          groupList.add(teacherNameAndGroupList[i]);
        }
      }

      forday2 = day1Lec.length;
      forday3 = day1Lec.length + day2Lec.length;
      forday4 = day1Lec.length + day2Lec.length + day3Lec.length;
      forday5 =
          day1Lec.length + day2Lec.length + day3Lec.length + day4Lec.length;
      forday6 = day1Lec.length +
          day2Lec.length +
          day3Lec.length +
          day4Lec.length +
          day5Lec.length;
    }
  }

  void parsingData() {
    var document = parse(schedule);
    var getday = document.getElementsByClassName('day');
    for (var days in getday) {
      var daylist = days.getElementsByTagName('h2');
      for (var day in daylist) {
        dayList.add(day.innerHtml);
      }
    }

    // end for loop for day
    // start loop for lecture number
    var getLecNo = document.getElementsByClassName('number');
    for (var number in getLecNo) {
      if (number.text != ' ') {
        lecNoList.add(number.text);
      }
      lecNoList2.add(number.text);
    }
    var day1 = lecNoList2.getRange(0, 8);
    for (var i in day1) {
      if (i != ' ') {
        day1Lec.add(i);
      }
    }

    var day2 = lecNoList2.getRange(8, 16);
    for (var i in day2) {
      if (i != ' ') {
        day2Lec.add(i);
      }
    }
    var day3 = lecNoList2.getRange(16, 24);
    for (var i in day3) {
      if (i != ' ') {
        day3Lec.add(i);
      }
    }
    var day4 = lecNoList2.getRange(24, 32);
    for (var i in day4) {
      if (i != ' ') {
        day4Lec.add(i);
      }
    }
    var day5 = lecNoList2.getRange(32, 40);
    for (var i in day5) {
      if (i != ' ') {
        day5Lec.add(i);
      }
    }
    var day6 = lecNoList2.getRange(40, 48);
    for (var i in day6) {
      if (i != ' ') {
        day6Lec.add(i);
      }
    }
    // end loop for lecture number
    // start loop for lecture type
    var getLecType = document.getElementsByClassName('type');
    for (var div1 in getLecType) {
      String lecType = div1.text;
      List a = lecType.split(RegExp(r"[0-9]"));
      lecTypeList.add(a.last);
    }
    // end loop for lecture type
    // start loop for lecture cabinate
    var getLecCab = document.getElementsByClassName('cab');
    for (var cab in getLecCab) {
      lecCabList.add(cab.text);
    }
    // end loop for lecture cabinate
    // start loop for lecture time
    var getLecTime = document.getElementsByClassName('time');
    for (var time in getLecTime) {
      lecTimeList.add(time.text);
    }
    // end loop for lecture time
    // start loop for lecture name
    var getLecName = document.getElementsByClassName('name');
    for (var name in getLecName) {
      lecNameList.add(name.text);
    }
    // end loop for lecture name
    // start loop for techer name
    var getTeacherName = document.getElementsByClassName('prep');
    for (var teacherdiv in getTeacherName) {
      var teacherli = teacherdiv.getElementsByTagName('ul');
      for (var teacher in teacherli) {
        teacherNameList.add(teacher.text);
        groupList.add(''); //for range
      }
    }
    forday2 = day1Lec.length;
    forday3 = day1Lec.length + day2Lec.length;
    forday4 = day1Lec.length + day2Lec.length + day3Lec.length;
    forday5 = day1Lec.length + day2Lec.length + day3Lec.length + day4Lec.length;
    forday6 = day1Lec.length +
        day2Lec.length +
        day3Lec.length +
        day4Lec.length +
        day5Lec.length;
  }

  @override
  void dispose() {
    adBanner.dispose();
    super.dispose();
  }
}
