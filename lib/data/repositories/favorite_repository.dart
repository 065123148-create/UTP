import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utp_flutter/data/services/favorite_service.dart';

class FavoriteRepository {
  final FavoriteService _service;

  FavoriteRepository(this._service);

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserFavorites() {
    return _service.getUserFavorites();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getVillaDetail(
    String villaId,
  ) {
    return _service.getVillaDetail(villaId);
  }

  Future<void> deleteFavorite(String villaId) {
    return _service.deleteFavorite(villaId);
  }
}
