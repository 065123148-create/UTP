// lib/modules/auth/otp/otp_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_viewmodel.dart';

class OtpView extends GetView<OtpViewModel> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Verifikasi OTP",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan kode OTP yang dikirim ke ${controller.phoneNumber}",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: controller.otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Kode OTP",
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ),
                onPressed: controller.verifyOtp,
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Verifikasi",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
