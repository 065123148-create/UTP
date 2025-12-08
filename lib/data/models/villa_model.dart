import 'package:cloud_firestore/cloud_firestore.dart';

class Villa {
  final String id;
  final String name;
  final String location;
  final int weekdayPrice;
  final int weekendPrice;
  final String imageUrl;
  final String description;
  final String mapsLink;

  Villa({
    required this.id,
    required this.name,
    required this.location,
    required this.weekdayPrice,
    required this.weekendPrice,
    required this.imageUrl,
    required this.description,
    required this.mapsLink,
  });

  factory Villa.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};

    return Villa(
      id: doc.id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      weekdayPrice: (data['weekday_price'] ?? 0) is int
          ? data['weekday_price']
          : (data['weekday_price'] ?? 0).toInt(),
      weekendPrice: (data['weekend_price'] ?? 0) is int
          ? data['weekend_price']
          : (data['weekend_price'] ?? 0).toInt(),
      imageUrl: data['image_url'] ?? '',
      description: data['description'] ?? '',
      mapsLink: data['maps_link'] ?? '',
    );
  }
}
