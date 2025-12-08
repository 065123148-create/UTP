import 'package:utp_flutter/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _service;

  AuthRepository(this._service);

  Future<String> login(String identifier, String password) {
    return _service.loginWithIdentifier(identifier, password);
  }
}
