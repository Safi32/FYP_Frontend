class RestaurantModel {
  final int id;
  final String name;
  final String imageURL;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageURL,
  });

  /// Factory constructor to create an instance from JSON
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: json['restaurantName']?.toString() ?? 'Unknown',
      imageURL: json['image']?.toString() ?? '',
    );
  }
}
