import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utp_flutter/app_session.dart';

class FavoriteService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String get uid {
    final id = AppSession.userDocId;
    if (id == null) throw 'User belum login';
    return id;
  }

  /// Stream seluruh favorit user
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserFavorites() {
    return _db
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  /// Ambil detail villa berdasarkan ID
  Future<DocumentSnapshot<Map<String, dynamic>>> getVillaDetail(
      String villaId) {
    return _db.collection('villas').doc(villaId).get();
  }

  /// Hapus favorit
  Future<void> deleteFavorite(String villaId) async {
    return _db
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(villaId)
        .delete();
  }
}
