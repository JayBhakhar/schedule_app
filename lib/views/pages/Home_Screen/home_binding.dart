import 'package:get/get.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}