class AppConstant {
  //User Side End-Points
  static const String signUpUri = "/api/users/register";
  static const String loginUri = "/api/users/login";
  static const String otpUri = "/otp";
  static const String verifyOtpUri = "/verify";

  //Restaurant End-Points

  static const String restaurantAdminLogin = "/api/restaurant/login";
  static const String addDeals = "/api/deals/add";
  static const String doneReservation = "/api/reservations/:reservationId/done";
  static const String cancelReservation =
      "/api/reservations/:reservationId/cancel";
  static const String seeAllReservation = "/api/reservation";
  static const String userLogout = "/api/restaurant/logout";
  static const String reservation = "/reservation";
  static const String getRestaurant = "/restaurants";
  static const String assigningRoles = "/api/roles/get-roles";
}
