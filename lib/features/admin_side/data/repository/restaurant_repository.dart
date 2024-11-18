import 'package:dine_deal/features/admin_side/data/data_source/restaurant_api_service.dart';
import 'package:dine_deal/features/admin_side/data/model/restaurant_model.dart';

abstract class RestaurantRepository {
  Future<void> listRestaurant(String restaurantId, RestaurantModel restaurant);
}

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantApiService _restaurantApiService;
  RestaurantRepositoryImpl(this._restaurantApiService);
  @override
  Future<void> listRestaurant(
      String restaurantId, RestaurantModel restaurant) async {
    try {
      await _restaurantApiService.listRestaurant(restaurant.toJson());
    } catch (e) {
      throw Exception("Failed to create resturant");
    }
  }
}
