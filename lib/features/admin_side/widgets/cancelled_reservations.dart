import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class CancelledReservations extends StatelessWidget {
  CancelledReservations({super.key});
  final List<Map<String, dynamic>> reservations = [
    {
      "image": "assets/Ellipse 1.png",
      "name": "Jane Smith",
      "rating": 4.5,
      "table": 4,
      "date": DateTime.now(),
      "person": 9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMMM').format(now);
    final formattedTime = DateFormat('hh:mm a').format(now);

    return reservations.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/reservation.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "No Upcoming Reservations",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final reservation = reservations[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Card(
                    elevation: 1,
                    color: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  reservation['image'],
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      reservation['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: reservation['rating'],
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              border: Border.all(
                                color: AppColors.black,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        "assets/calendar_month.png",
                                      ),
                                    ),
                                    Text(
                                      DateFormat('dd MMM').format(
                                        reservation['date'],
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.watch_later_outlined,
                                      size: 20,
                                    ),
                                    Text(
                                      DateFormat('hh:mm a').format(
                                        reservation['date'],
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        "assets/table_bar.png",
                                      ),
                                    ),
                                    Text(
                                      "${reservation['table']}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        "assets/group.png",
                                      ),
                                    ),
                                    Text(
                                      "${reservation['person']}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
