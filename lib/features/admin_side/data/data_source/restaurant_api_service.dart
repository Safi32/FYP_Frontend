import 'package:dine_deal/config/app_config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'restaurant_api_service.g.dart';

@RestApi(baseUrl: AppConfig.baseURL)
abstract class RestaurantApiService {
  factory RestaurantApiService(Dio dio) = _RestaurantApiService;

  @POST("/restaurant")
  Future<void> listRestaurant(@Body() Map<String, dynamic> restaurantData);
}
