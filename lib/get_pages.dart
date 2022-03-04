import 'package:get/get.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_binding.dart';
import 'package:schedule_app/views/pages/Home_Screen/home_view.dart';

List<GetPage> getPagesList = [
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
];
