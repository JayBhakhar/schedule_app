import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/service/api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var groupsList = List.empty().obs;
  var lettersList = List.empty().obs;
  var buildingsList = List.empty().obs;
  RxInt facultyId = 0.obs;
  RxInt index = 0.obs;

  void _scontroller() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent == 0.0 ? 350 : 550,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void getGroupsList() async {
    var groups = await ApiProvider().getGroupsList();
    if (groups != null) {
      groupsList.value = groups;
    }
    _scontroller();
    update();
  }

  void getLettersList() async {
    var letters = await ApiProvider().getLettersList();
    if (letters != null) {
      lettersList.value = letters;
    }
    _scontroller();
    update();
  }

  void getBuildingsList() async {
    var buildings = await ApiProvider().getBuildingsList();
    if (buildings != null) {
      buildingsList.value = buildings;
    }
    _scontroller();
    update();
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
