class Place {
  final String id;
  final String name;
  final String state;
  final String category;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String contact;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.state,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.contact,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is num) return v.toDouble();
      return double.tryParse(v.toString()) ?? 0.0;
    }

    return Place(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      state: json['state'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      latitude: toDouble(json['latitude']),
      longitude: toDouble(json['longitude']),
      contact: json['contact'] ?? '',
      rating: toDouble(json['rating']),
    );
  }
}
