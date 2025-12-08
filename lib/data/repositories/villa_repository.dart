import '../models/villa_model.dart';
import '../services/villa_service.dart';

class VillaRepository {
  final VillaService _service;

  VillaRepository(this._service);

  Future<List<Villa>> fetchVillas() {
    return _service.getAllVillas();
  }
}
