import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utp_flutter/app_session.dart';
import 'package:utp_flutter/main.dart'; // untuk MainPage

class RegisterViewModel extends GetxController {
  // Text controller
  final nameC = TextEditingController();
  final phoneC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  // State
  final isLoading = false.obs;
  final errorMessage = RxnString();

  final _usersRef = FirebaseFirestore.instance.collection('users');

  @override
  void onClose() {
    nameC.dispose();
    phoneC.dispose();
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  Future<void> register() async {
    var name = nameC.text.trim();
    var phone = phoneC.text.trim();
    final email = emailC.text.trim();
    final password = passwordC.text.trim();

    if (name.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Semua field wajib diisi.';
      return;
    }

    // normalisasi nomor: hapus 0 depan
    if (phone.startsWith('0')) {
      phone = phone.substring(1);
    }

    isLoading.value = true;
    errorMessage.value = null;

    try {
      // cek email
      final emailSnap = await _usersRef
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (emailSnap.docs.isNotEmpty) {
        errorMessage.value = 'Email sudah terdaftar.';
        isLoading.value = false;
        return;
      }

      // cek phone
      final phoneSnap = await _usersRef
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();

      if (phoneSnap.docs.isNotEmpty) {
        errorMessage.value = 'Nomor telepon sudah terdaftar.';
        isLoading.value = false;
        return;
      }

      // simpan user baru
      await _usersRef.add({
        'name': name,
        'phone': phone,
        'email': email,
        'password': password, // catatan: nanti sebaiknya di-hash
        'role': 'user',
        'profile_img': '',
        'created_at': FieldValue.serverTimestamp(),
      });

      // auto login berdasarkan phone (sama seperti kode lama)
      await AppSession.saveUser(phone);

      isLoading.value = false;

      // masuk ke MainPage (bottom nav)
      Get.offAll(() => const MainPage());
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan: $e';
      isLoading.value = false;
    }
  }
}
