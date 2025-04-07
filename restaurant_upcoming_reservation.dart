import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/get_booking_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/admin_side/widgets/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantUpcomingReservation extends StatefulWidget {
  const RestaurantUpcomingReservation({super.key});

  @override
  State<RestaurantUpcomingReservation> createState() =>
      _RestaurantUpcomingReservationState();
}

class _RestaurantUpcomingReservationState
    extends State<RestaurantUpcomingReservation> {
  String selectedFilter = 'Total';
  List<dynamic> filteredBookings = [];

  Future<void> fetchFilteredBookings(String filter) async {
    final ReservationController reservationController =
        Get.put(ReservationController());

    List<dynamic> bookings = reservationController.reservations;
    DateTime now = DateTime.now();

    switch (filter) {
      case 'Daily':
        bookings = reservationController.reservations.where((booking) {
          DateTime bookingDate = DateTime.parse(booking["date"]);
          return bookingDate.day == now.day &&
              bookingDate.month == now.month &&
              bookingDate.year == now.year;
        }).toList();
        break;
      case 'Weekly':
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        bookings = reservationController.reservations.where((booking) {
          DateTime bookingDate = DateTime.parse(booking["date"]);
          return bookingDate.isAfter(startOfWeek) &&
              bookingDate.isBefore(endOfWeek);
        }).toList();
        break;
      case 'Monthly':
        bookings = reservationController.reservations.where((booking) {
          DateTime bookingDate = DateTime.parse(booking["date"]);
          return bookingDate.month == now.month && bookingDate.year == now.year;
        }).toList();
        break;
      case 'Yearly':
        bookings = reservationController.reservations.where((booking) {
          DateTime bookingDate = DateTime.parse(booking["date"]);
          return bookingDate.year == now.year;
        }).toList();
        break;
      default:
        bookings = reservationController
            .reservations; // Default is showing all bookings (Total)
    }

    setState(() {
      filteredBookings = bookings; // Update the filteredBookings state
    });
  }

  @override
  void initState() {
    super.initState();

    fetchFilteredBookings('Total');
  }

  @override
  Widget build(BuildContext context) {
    final ReservationController reservationController =
        Get.put(ReservationController());

    final BookingController bookingController = Get.put(BookingController());

    return Obx(() {
      if (reservationController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (reservationController.errorMessage.isNotEmpty) {
        return Center(child: Text(reservationController.errorMessage.value));
      } else if (reservationController.reservations.isEmpty) {
        return const Center(child: Text('No reservations found.'));
      } else {
        final latestReservations =
            reservationController.reservations.take(1).toList();

        return ListView(
          children: [
            ...latestReservations
                .map((reservation) => SizedBox(
                      height: Get.height * 0.25,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              reservation["username"],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                            const Image(
                                              image: AssetImage(
                                                  "assets/menu_vertical.png"),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Text(
                                              "Deal:",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              reservation["deals"],
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 30,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                        image: AssetImage("assets/clock.png")),
                                    const SizedBox(width: 10),
                                    Text(
                                      "${reservation["formattedDate"]}, 12:00",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Image(
                                        image: AssetImage("assets/group.png")),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Table for ${reservation["numberOfPersons"]}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Image(
                                        image:
                                            AssetImage("assets/table_bar.png")),
                                    const SizedBox(width: 10),
                                    Text(
                                      reservation["tableNumber"],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
            if (reservationController.reservations.length > 2)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => AllReservationsScreen(
                          reservations: reservationController.reservations));
                    },
                    child: const Text("View More"),
                  ),
                ),
              ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Reservation Analytics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterContainer('Daily'),
                _buildFilterContainer('Weekly'),
                _buildFilterContainer('Monthly'),
                _buildFilterContainer('Yearly'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bookings",
                ),
                Text(
                  "12.5%",
                  style: TextStyle(
                    color: Color(0xFF10B981),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () {
                if (bookingController.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                if (bookingController.errorMessage.isNotEmpty) {
                  return Text(
                    bookingController.errorMessage.value,
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${bookingController.total.value}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Overview",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Export Data",
                      ),
                      Image(
                        image: AssetImage(
                          "assets/export_data.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              child: BarGraph(
                values: const [50, 80, 120, 90, 150, 70, 110],
                labels: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                maxValue: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }
    });
  }

  Widget _buildFilterContainer(String filter) {
    bool isSelected = selectedFilter == filter;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
        fetchFilteredBookings(filter);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          filter,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class AllReservationsScreen extends StatelessWidget {
  final List<dynamic> reservations;

  const AllReservationsScreen({Key? key, required this.reservations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        automaticallyImplyLeading: false,
        title: const Text(
          'All Reservations',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          var reservation = reservations[index];
          return SizedBox(
            height: Get.height * 0.25,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    reservation["username"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Image(
                                    image:
                                        AssetImage("assets/menu_vertical.png"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text(
                                    "Deal:",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    reservation["deals"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 30,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(image: AssetImage("assets/clock.png")),
                          const SizedBox(width: 10),
                          Text(
                            "${reservation["formattedDate"]}, 12:00",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Image(image: AssetImage("assets/group.png")),
                          const SizedBox(width: 10),
                          Text(
                            "Table for ${reservation["numberOfPersons"]}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Image(
                              image: AssetImage("assets/table_bar.png")),
                          const SizedBox(width: 10),
                          Text(
                            reservation["tableNumber"],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
