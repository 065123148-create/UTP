import 'package:flutter/material.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedCountry = "ID";
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
      automaticallyImplyLeading: false,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// JUDUL
              const Text(
                "Masuk atau daftar di SewaVilla",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              /// NEGARA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: selectedCountry,
                          items: const [
                            DropdownMenuItem(
                              value: "ID",
                              child: Text(
                                "Negara / Wilayah\nIndonesia (+62)",
                                style: TextStyle(height: 1.3),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() => selectedCountry = value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// INPUT NOMOR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Nomor Telepon",
                    prefixText: "+62   ",
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Kami akan mengirimkan SMS untuk mengonfirmasi nomor anda. Dikenakan tarif standar SMS.",
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),

              const SizedBox(height: 25),

              /// TOMBOL LANJUTKAN
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            OtpPage(phoneNumber: phoneController.text),
                      ),
                    );
                  },
                  child: const Text(
                    "Lanjutkan",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// GARIS ATAU
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Atau"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 25),

              /// LOGIN EMAIL
              _loginButton(
                icon: Icons.email_outlined,
                text: "Lanjutkan dengan Email",
              ),

              const SizedBox(height: 12),

              /// LOGIN FACEBOOK
              _loginButton(
                icon: Icons.facebook,
                text: "Lanjutkan dengan Facebook",
              ),

              const SizedBox(height: 12),

              /// LOGIN GOOGLE
              _loginButton(
                icon: Icons.g_mobiledata,
                text: "Lanjutkan dengan Google",
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// WIDGET TOMBOL LOGIN EKSTRA
  Widget _loginButton({required IconData icon, required String text}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 13),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
