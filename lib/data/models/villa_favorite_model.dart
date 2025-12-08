class VillaFavorite {
  final String id;
  final VillaFavoriteData villaData;

  VillaFavorite({
    required this.id,
    required this.villaData,
  });
}

class VillaFavoriteData {
  final String id;
  final String name;
  final String location;

  VillaFavoriteData({
    required this.id,
    required this.name,
    required this.location,
  });
}
