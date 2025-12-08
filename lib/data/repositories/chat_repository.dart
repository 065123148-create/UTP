import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utp_flutter/data/services/chat_service.dart';

class ChatRepository {
  final ChatService _service;

  ChatRepository(this._service);

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsForUser(String userId) {
    return _service.getChatsForUser(userId);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getVillaDetail(
      String villaId) {
    return _service.getVillaById(villaId);
  }
}
