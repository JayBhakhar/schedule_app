import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/service/api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  final ScrollController scrollController = ScrollController();
  RxInt facultyId = 0.obs;
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    change(
      [],
      status: RxStatus.success(),
    );
  }

  void _scontroller() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent == 0.0 ? 350 : 550,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void getGroupsList() {
    ApiProvider().getGroupsList().then((data) {
      change(
        data,
        status: RxStatus.success(),
      );
      _scontroller();
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(
          err.toString(),
        ),
      );
    });
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
