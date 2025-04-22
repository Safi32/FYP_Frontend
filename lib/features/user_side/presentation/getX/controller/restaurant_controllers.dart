import 'package:dine_deal/features/admin_side/data/model/restaurant_model.dart';
import 'package:get/get.dart';

class RestaurantControllers extends GetxController {
  var selectedRestaurant = RestaurantModel(name: "", imageURL: "").obs;

  void setRestaurant(RestaurantModel restaurant) {
    selectedRestaurant.value = restaurant;
  }
}
