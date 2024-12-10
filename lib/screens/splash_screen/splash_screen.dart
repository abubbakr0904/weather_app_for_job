import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen/home_screen.dart';
import 'package:weather_app/service/cache_service/cache_service.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool darkMode = false;

  init() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
  }

  @override
  void initState() {
    init();
    darkMode = CacheService.getBool("dark_mode");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : AppColors.c47BFDF,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashImage,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
