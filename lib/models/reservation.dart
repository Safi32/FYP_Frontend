class Reservation {
  final int id;
  final String reservationTime;
  final String reservationDate;
  final int numberOfPersons;
  final String reservationPlace;
  final String reservationStatus;
  final int? restaurantId;
  final List<String>? deals;
  final String? additionalNotes;
  final String createdAt;
  final String updatedAt;
  final int? userId;
  final int? reservationTableId;

  Reservation({
    required this.id,
    required this.reservationTime,
    required this.reservationDate,
    required this.numberOfPersons,
    required this.reservationPlace,
    required this.reservationStatus,
    this.restaurantId,
    this.deals,
    this.additionalNotes,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
    this.reservationTableId,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      reservationTime: json['reservationTime'],
      reservationDate: json['reservationDate'],
      numberOfPersons: json['numberOfPersons'],
      reservationPlace: json['reservationPlace'],
      reservationStatus: json['reservationStatus'],
      restaurantId: json['restaurantId'],
      deals: (json['deals'] != null)
          ? (json['deals'] as String)
              .replaceAll(RegExp(r'[\[\]"]'), '')
              .split(',')
              .map((e) => e.trim())
              .toList()
          : null,
      additionalNotes: json['additionalNotes'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
      reservationTableId: json['reservationTableId'],
    );
  }
}
