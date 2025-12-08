import 'package:get/get.dart';
import 'package:utp_flutter/modules/home/home_binding.dart';
import 'package:utp_flutter/modules/home/home_view.dart';
// import auth binding dll nanti

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.login,
    //   page: () => const LoginView(),
    //   binding: LoginBinding(),
    // ),
  ];
}
