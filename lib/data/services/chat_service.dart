import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Stream semua chat milik user tertentu
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsForUser(String userId) {
    return _db
        .collection('chats')
        .where('user_id', isEqualTo: userId)
        .orderBy('last_timestamp', descending: true)
        .snapshots();
  }

  /// Ambil detail villa
  Future<DocumentSnapshot<Map<String, dynamic>>> getVillaById(
      String villaId) {
    return _db.collection('villas').doc(villaId).get();
  }
}
