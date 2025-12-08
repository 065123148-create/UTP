import 'package:get/get.dart';
import 'package:utp_flutter/app_session.dart';
import 'package:utp_flutter/data/repositories/auth_repository.dart';
import 'package:utp_flutter/main.dart'; // untuk MainPage

class LoginViewModel extends GetxController {
  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);

  final isLoading = false.obs;
  final errorMessage = RxnString();

  Future<void> login(String identifier, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final phoneFromDb = await _authRepository.login(
        identifier.trim(),
        password.trim(),
      );

      final ok = await AppSession.saveUser(phoneFromDb);
      if (!ok) {
        errorMessage.value = 'Gagal menyimpan sesi pengguna';
        return;
      }

      // kalau sukses, masuk ke MainPage
      Get.offAll(() => const MainPage());
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
