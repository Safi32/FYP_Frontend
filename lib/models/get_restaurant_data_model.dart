class Restaurant {
  final int id;
  final String restaurantName;
  final String restaurantAddress;
  final String websiteUrl;
  final List<String> socialMediaLinks;
  final String restaurantType;
  final String operationalHours;
  final int minPriceRange;
  final int maxPriceRange;
  final String acceptReservation;
  final int restaurantMinDays;
  final int restaurantMinHours;
  final List<String> restaurantFeatures;
  final String phoneNumber;
  final List<String> restaurantInfo;
  final String image;
  final String additionalNotes;

  Restaurant({
    required this.id,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.websiteUrl,
    required this.socialMediaLinks,
    required this.restaurantType,
    required this.operationalHours,
    required this.minPriceRange,
    required this.maxPriceRange,
    required this.acceptReservation,
    required this.restaurantMinDays,
    required this.restaurantMinHours,
    required this.restaurantFeatures,
    required this.phoneNumber,
    required this.restaurantInfo,
    required this.image,
    required this.additionalNotes,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      restaurantName: json['restaurantName'],
      restaurantAddress: json['restaurantAddress'],
      websiteUrl: json['websiteUrl'],
      socialMediaLinks: json['socialMediaLinks'].split(", "),
      restaurantType: json['restaurantType'],
      operationalHours: json['operationalHours'],
      minPriceRange: json['minPriceRange'],
      maxPriceRange: json['maxPriceRange'],
      acceptReservation: json['acceptReservation'],
      restaurantMinDays: json['restaurantMinDays'],
      restaurantMinHours: json['restaurantMinHours'],
      restaurantFeatures: json['restaurantFeatures'].split(", "),
      phoneNumber: json['phoneNumber'],
      restaurantInfo: json['restaurantInfo'].split(","),
      image: json['image'],
      additionalNotes: json['additionalNotes'],
    );
  }
}
