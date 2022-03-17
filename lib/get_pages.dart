import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schedule_app/devloper_page.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_binding.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_view.dart';
import 'package:schedule_app/views/pages/Schedule/schedule_binding.dart';
import 'package:schedule_app/views/pages/Schedule/schedule_view.dart';

GetStorage box = GetStorage();

List<GetPage> getPagesList = [
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
  GetPage(
      name: "/schedule",
      page: () => ScheduleView(),
      binding: ScheduleBinding()),
  // GetPage(name: "/choosecolors", page: () => ChooseColorsView(), binding: ChooseColorsBinding()),
  GetPage(name: "/devloper", page: () => DevloperPage()),
];
