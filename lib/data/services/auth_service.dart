import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Login pakai email atau nomor telepon.
  /// Return: phone dari database jika berhasil.
  Future<String> loginWithIdentifier(String identifier, String password) async {
    final input = identifier.trim();
    final pass = password.trim();

    if (input.isEmpty || pass.isEmpty) {
      throw 'Email/nomor dan password wajib diisi';
    }

    QuerySnapshot<Map<String, dynamic>> snap;

    if (input.contains('@')) {
      // login pakai email
      snap = await _db
          .collection('users')
          .where('email', isEqualTo: input)
          .limit(1)
          .get();
    } else {
      // login pakai nomor telepon
      String phone = input;
      if (phone.startsWith('0')) {
        phone = phone.substring(1); // sama seperti kode lama kamu
      }

      snap = await _db
          .collection('users')
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();
    }

    if (snap.docs.isEmpty) {
      throw 'Akun tidak ditemukan';
    }

    final doc = snap.docs.first;
    final data = doc.data();

    final String passwordDb = (data['password'] ?? '').toString();
    if (passwordDb != pass) {
      throw 'Password salah';
    }

    final String phoneFromDb = (data['phone'] ?? '').toString();
    return phoneFromDb;
  }
}
