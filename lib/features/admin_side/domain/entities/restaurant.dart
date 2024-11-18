import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? websiteURL;
  final String? socialMediaLink;
  final bool? restaurantType;
  final int? operatingHours;
  final int? minimumPriceRange;
  final int? maximumPriceRange;
  final String? restaurantInfo;
  final bool? restaurantPolicies;
  final int? advanceReservationDays;
  final int? advanceReservationHours;
  final bool? restaurantFeatures;
  final String? additionalInformation;
  final String? imageUrl;

  const RestaurantEntity({
    this.name,
    this.phoneNumber,
    this.email,
    this.address,
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
    this.imageUrl,
  });

  @override
  List<Object?> get props {
    return [
      name,
      phoneNumber,
      email,
      address,
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
      imageUrl,
    ];
  }
}
