import 'package:dine_deal/features/admin_side/domain/entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<void> listRestaurant(RestaurantEntity restaurant);

  Future<List<RestaurantEntity>> getRestaurants();

  Future<void> updateRestaurant(String id, RestaurantEntity restaurant);

  Future<void> deleteRestaurant(String id);
}
