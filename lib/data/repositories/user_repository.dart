import 'package:utp_flutter/data/services/user_service.dart';

class UserRepository {
  final UserService _service;

  UserRepository(this._service);

  Stream<bool> isFavorite(String villaId) {
    return _service.isFavoriteStream(villaId);
  }

  Future<void> toggleFavorite(String villaId) {
    return _service.toggleFavorite(villaId);
  }
}
