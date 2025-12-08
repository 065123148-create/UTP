// lib/modules/auth/otp/otp_binding.dart
import 'package:get/get.dart';
import 'otp_viewmodel.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // Ambil argument dari Get.toNamed('/otp', arguments: {...})
    final args = Get.arguments as Map<String, dynamic>?;

    final phoneNumber = args?['phoneNumber'] as String? ?? '';

    Get.lazyPut<OtpViewModel>(() => OtpViewModel(phoneNumber));
  }
}
