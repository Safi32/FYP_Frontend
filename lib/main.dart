import 'package:dine_deal/binding.dart';
import 'package:dine_deal/features/user_side/presentation/pages/splash_screen.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/otp_screen.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUp(),
        ),
        GetPage(name: '/otp-verification', page: () => OtpScreen()),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
      ],
    );
  }
}
