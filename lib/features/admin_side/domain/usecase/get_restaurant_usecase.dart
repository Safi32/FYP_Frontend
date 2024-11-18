import 'package:dine_deal/features/admin_side/domain/entities/restaurant.dart';
import 'package:dine_deal/features/admin_side/domain/respository/restaurant_repository.dart';

class GetRestaurantUseCase {
  final RestaurantRepository repository;

  GetRestaurantUseCase(this.repository);

  Future<List<RestaurantEntity>> execute() async {
    try {
      return await repository.getRestaurants();
    } catch (e) {
      throw Exception("Failed to fetch restaurants: $e");
    }
  }
}
