import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_viewmodel.dart';
import 'register_view.dart';
import 'register_binding.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // sama seperti LoginPage lama: controller lokal untuk form
    final TextEditingController emailOrPhoneController =
        TextEditingController();
    final TextEditingController passwordController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        // agar tidak overflow di layar kecil
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              const Text(
                "Masuk ke Akun Anda",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Email / Phone
              TextField(
                controller: emailOrPhoneController,
                decoration: const InputDecoration(
                  labelText: "Email atau Nomor Telepon",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // Error message (pakai obs dari ViewModel)
              Obx(() {
                final msg = controller.errorMessage.value;
                if (msg == null) return const SizedBox.shrink();
                return Text(
                  msg,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                  ),
                );
              }),

              const SizedBox(height: 20),

              // Tombol Login (pakai obs isLoading)
              Obx(() {
                final loading = controller.isLoading.value;
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: loading
                        ? null
                        : () {
                            controller.login(
                              emailOrPhoneController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 18),

              // Tombol ke Register (versi modules)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun? "),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => const RegisterView(),
                        binding: RegisterBinding(),
                      );
                    },
                    child: const Text("Daftar"),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
