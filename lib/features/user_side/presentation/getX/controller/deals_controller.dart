import 'package:get/get.dart';

class DealsController extends GetxController {
  var isDealAdded = false.obs;
  var dealName = 'Explore Deals'.obs;

  // Function to toggle between add and remove
  void toggleDeal() {
    if (isDealAdded.value) {
      isDealAdded.value = false;
      dealName.value = 'Explore Deals';
    } else {
      isDealAdded.value = true;
      dealName.value = 'Deal Name'; // Set this dynamically as per your deal
    }
  }
}
