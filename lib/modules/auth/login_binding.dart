import 'package:get/get.dart';
import 'package:utp_flutter/data/repositories/auth_repository.dart';
import 'package:utp_flutter/data/services/auth_service.dart';
import 'login_viewmodel.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find<AuthService>()));
    Get.lazyPut<LoginViewModel>(() => LoginViewModel(Get.find<AuthRepository>()));
  }
}
