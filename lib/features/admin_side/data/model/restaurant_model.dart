import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String? id;
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? websiteURL;
  final String? socialMediaLink;
  final String? restaurantType;
  final int? operatingHours;
  final int? minimumPriceRange;
  final int? maximumPriceRange;
  final String? restaurantInfo;
  final String? restaurantPolicies;
  final int? advanceReservationDays;
  final int? advanceReservationHours;
  final bool? restaurantFeatures;
  final String? additionalInformation;
  final String? imageURL;

  const RestaurantModel({
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.email,
    this.websiteURL,
    this.socialMediaLink,
    this.restaurantType,
    this.operatingHours,
    this.minimumPriceRange,
    this.maximumPriceRange,
    this.restaurantInfo,
    this.restaurantPolicies,
    this.advanceReservationDays,
    this.advanceReservationHours,
    this.restaurantFeatures,
    this.additionalInformation,
    this.imageURL,
  });

  /// Factory method to parse data from JSON
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      websiteURL: json['websiteURL'] as String?,
      socialMediaLink: json['socialMediaLink'] as String?,
      restaurantType: json['restaurantType'] as String?,
      operatingHours: json['operatingHours'] as int?,
      minimumPriceRange: json['minimumPriceRange'] as int?,
      maximumPriceRange: json['maximumPriceRange'] as int?,
      restaurantInfo: json['restaurantInfo'] as String?,
      restaurantPolicies: json['restaurantPolicies'] as String?,
      advanceReservationDays: json['advanceReservationDays'] as int?,
      advanceReservationHours: json['advanceReservationHours'] as int?,
      restaurantFeatures: json['restaurantFeatures'] as bool?,
      additionalInformation: json['additionalInformation'] as String?,
      imageURL: json['imageURL'] as String?,
    );
  }

  /// Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'websiteURL': websiteURL,
      'socialMediaLink': socialMediaLink,
      'restaurantType': restaurantType,
      'operatingHours': operatingHours,
      'minimumPriceRange': minimumPriceRange,
      'maximumPriceRange': maximumPriceRange,
      'restaurantInfo': restaurantInfo,
      'restaurantPolicies': restaurantPolicies,
      'advanceReservationDays': advanceReservationDays,
      'advanceReservationHours': advanceReservationHours,
      'restaurantFeatures': restaurantFeatures,
      'additionalInformation': additionalInformation,
      'imageURL': imageURL,
    };
  }

  /// Equatable properties for value comparison
  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phoneNumber,
        email,
        websiteURL,
        socialMediaLink,
        restaurantType,
        operatingHours,
        minimumPriceRange,
        maximumPriceRange,
        restaurantInfo,
        restaurantPolicies,
        advanceReservationDays,
        advanceReservationHours,
        restaurantFeatures,
        additionalInformation,
        imageURL,
      ];
}
