class AppConstant {
  //User Side End-Points
  static const String signUpUri = "/api/users/register";
  static const String loginUri = "/api/users/login";
  static const String sendOtp = "/api/users/send-otp";
  static const String getOtp = "/api/users/verify-otp";
  static const String getAllUser = "/api/users/users";
  static const String logout = "/api/users/logout";
  static const String changePassword = "/api/users/change-password";

  //Restaurant End-Points
  static const String signInRestaurant = "/api/restaurant/create";
  static const String restaurantAdminLogin = "/api/restaurant/login";
  static const String addDeals = "/api/deals";
  static const String getDeals = "/api/deals";
  static const String doneReservation = "/api/reservations/:reservationId/done";
  static const String cancelReservation =
      "/api/reservations/:reservationId/cancel";
  static const String getType = "/api/restaurant/types";
  static const String seeAllReservation = "/api/reservation";
  static const String userLogout = "/api/restaurant/logout";
  static const String reservation = "/api/reservation/create";
  static const String getRestaurant = "/api/restaurant/all";
  static const String assigningRoles = "/api/roles/get-roles";
  static const String getAllReservations = "/api/reservation/get";
  static const String filterRestaurant = "/api/filters/filter";
  static const String getRestaurantName = "/api/restaurant";
  static const String getRestaurantNameById =
      "/api/restaurant/name/user/:userId";
}
