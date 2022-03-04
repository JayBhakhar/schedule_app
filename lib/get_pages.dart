import 'package:get/get.dart';
import 'package:schedule_app/devloper_page.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_binding.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_view.dart';

List<GetPage> getPagesList = [
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
  // GetPage(name: "/choosecolors", page: () => ChooseColorsView(), binding: ChooseColorsBinding()),
  GetPage(name: "/devloper", page: () => DevloperPage()),
];
