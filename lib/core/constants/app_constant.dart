class AppConstant {
  //User Side End-Points
  static const String signUpUri = "/api/users/register";
  static const String loginUri = "/api/users/login";
  static const String otpUri = "/otp";
  static const String verifyOtpUri = "/verify";
  static const String getAllUser = "/api/users/users";

  //Restaurant End-Points
  static const String signInRestaurant = "/api/restaurant/create";
  static const String restaurantAdminLogin = "/api/restaurant/login";
  static const String addDeals = "/api/deals";
  static const String getDeals = "/api/deals";
  static const String doneReservation = "/api/reservations/:reservationId/done";
  static const String cancelReservation =
      "/api/reservations/:reservationId/cancel";
  static const String seeAllReservation = "/api/reservation";
  static const String userLogout = "/api/restaurant/logout";
  static const String reservation = "/api/reservation/create";
  static const String getRestaurant = "/api/restaurant/get-restaurant";
  static const String assigningRoles = "/api/roles/get-roles";
  static const String getAllReservations = "/api/reservation/get";
}
