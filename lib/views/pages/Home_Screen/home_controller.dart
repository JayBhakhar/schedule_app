import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/service/api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var groupsList = List.empty();
  var lettersList = List.empty();
  var buildingsList = List.empty();
  var teachersList = List.empty();
  var roomsList = List.empty();
  RxInt facultyId = 0.obs;
  RxInt index = 0.obs;
  bool isLoading = false;
  
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
    isLoading = true;
    update();
    var groups = await ApiProvider().getGroupsList();
    if (groups != null) {
      groupsList = groups;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getLettersList() async {
    isLoading = true;
    update();
    var letters = await ApiProvider().getLettersList();
    if (letters != null) {
      lettersList = letters;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getBuildingsList() async {
    isLoading = true;
    update();
    var buildings = await ApiProvider().getBuildingsList();
    if (buildings != null) {
      buildingsList = buildings;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getTeachersList(String letterId) async {
    isLoading = true;
    update();
    var teachers = await ApiProvider().getTeachersList(letterId);
    if (teachers != null) {
      teachersList = teachers;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getRoomsList(String roomId) async {
    isLoading = true;
    update();
    var rooms = await ApiProvider().getRoomsList(roomId);
    if (rooms != null) {
      roomsList = rooms;
    }
    _scontroller();
    isLoading = false;
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
