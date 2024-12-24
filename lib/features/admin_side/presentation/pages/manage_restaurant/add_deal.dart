import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/add_deals_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/email_remainder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddDealScreen extends StatelessWidget {
  AddDealScreen({super.key});

  final AddDealsController addDealsController = Get.put(AddDealsController());

  final TextEditingController dealNameController = TextEditingController();
  final TextEditingController dealCategoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController dealDetailsController = TextEditingController();
  final RxString mediaPath = ''.obs;
  final RxString selectedCategory = ''.obs;

  Future<void> pickMedia() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      mediaPath.value = file.path;
    } else {
      Get.snackbar("Error", "No media selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Add Deals",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "List Your Restaurant Deals here.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Deal Name",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: dealNameController,
                  decoration: InputDecoration(
                    hintText: "Enter the deal name",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Deal Category",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: selectedCategory.value.isEmpty
                        ? null
                        : selectedCategory.value,
                    items: [
                      "Deals for Two Person",
                      "Family",
                      "Others",
                    ]
                        .map(
                          (category) => DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      selectedCategory.value = value ?? "";
                    },
                    decoration: InputDecoration(
                      hintText: "Select your deal category",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter the deal price",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Deal Details",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: dealDetailsController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Enter the deal details",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Media",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: pickMedia,
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.upload_file,
                                  color: Colors.orange),
                              const SizedBox(width: 10),
                              Text(
                                mediaPath.value.isEmpty
                                    ? "Upload Media"
                                    : "Media Selected",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                EmailReminder(
                  title: "Mark as deal for today",
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.orange,
                          ),
                          onPressed: addDealsController.isLoading.value
                              ? null
                              : () {
                                  print(
                                      "Deal Name: ${dealNameController.text.trim()}");
                                  print(
                                      "Deal Category: ${selectedCategory.value}");
                                  print(
                                      "Deal Price: ${priceController.text.trim()}");
                                  print(
                                      "Deal Details: ${dealDetailsController.text.trim()}");
                                  print("Media Path: ${mediaPath.value}");
                                  addDealsController.addDeals(
                                    dealName: dealNameController.text.trim(),
                                    dealCategory: selectedCategory.value.trim(),
                                    dealPrice: double.tryParse(
                                            priceController.text.trim()) ??
                                        0.0,
                                    dealDetails:
                                        dealDetailsController.text.trim(),
                                    mediaPath: mediaPath.value,
                                  );
                                },
                          child: addDealsController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: AppColors.surface,
                                )
                              : const Text(
                                  "Upload",
                                  style: TextStyle(
                                    color: AppColors.surface,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
