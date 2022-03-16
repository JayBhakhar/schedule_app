import 'package:get/get.dart';
import 'package:schedule_app/views/pages/Schedule/schedule_controller.dart';

class ScheduleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
  }
}