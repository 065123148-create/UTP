import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/villa_model.dart';

class VillaService {
  final CollectionReference _villasRef = FirebaseFirestore.instance.collection(
    'villas',
  );

  Future<List<Villa>> getAllVillas() async {
    final querySnapshot = await _villasRef.get();
    return querySnapshot.docs.map((doc) => Villa.fromDocument(doc)).toList();
  }
}
