import 'package:get/get.dart';
import 'register_viewmodel.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterViewModel>(() => RegisterViewModel());
  }
}
