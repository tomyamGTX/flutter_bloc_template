class BusinessModel {
  final String id;
  final String name;
  final String category; // "Food", "Services", etc.
  final String city; // "Shah Alam"
  final String state; // "Selangor"
  final double rating; // 4.5
  final int reviews; // 124
  final List<String> images;
  final String description;
  final String phone;
  final String address;
  final bool isVerified;
  final double lat;
  final double lng;
  final String priceRange; // "$", "$$", "$$$"

  BusinessModel({
    required this.id,
    required this.name,
    required this.category,
    required this.city,
    required this.state,
    required this.rating,
    required this.reviews,
    required this.images,
    required this.description,
    required this.phone,
    required this.address,
    required this.isVerified,
    required this.lat,
    required this.lng,
    required this.priceRange,
  });

  // Firestore converter
  factory BusinessModel.fromMap(String id, Map<String, dynamic> data) {
    return BusinessModel(
      id: id,
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      reviews: data['reviews'] ?? 0,
      images: List<String>.from(data['images'] ?? []),
      description: data['description'] ?? '',
      phone: data['phone'] ?? '',
      address: data['address'] ?? '',
      isVerified: data['isVerified'] ?? false,
      lat: (data['lat'] ?? 0).toDouble(),
      lng: (data['lng'] ?? 0).toDouble(),
      priceRange: data['priceRange'] ?? '\$',
    );
  }
}
