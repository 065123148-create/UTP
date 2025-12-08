import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_viewmodel.dart';

class RegisterView extends GetView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Akun')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              decoration: const InputDecoration(
                labelText: 'Nama lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.phoneC,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor Telepon',
                hintText: 'Contoh: 0812345678',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.emailC,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.passwordC,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // error message
            Obx(() {
              final msg = controller.errorMessage.value;
              if (msg == null) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  msg,
                  style: const TextStyle(color: Colors.red, fontSize: 13),
                ),
              );
            }),

            Obx(() {
              final loading = controller.isLoading.value;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : controller.register,
                  child: loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Daftar'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
