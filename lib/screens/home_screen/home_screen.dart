import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/home_screen/widget/weather_item.dart';
import 'package:weather_app/screens/search_screen/search_screen.dart';
import 'package:weather_app/service/app_service/app_service.dart';
import 'package:weather_app/service/cache_service/cache_service.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/constants/app_constants.dart';
import 'package:weather_app/utils/images/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherFactory weatherFactory = WeatherFactory(AppConstants.apiKey);
  Weather? weather;
  List<Weather> hourlyForecast = [];
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    getData();
    getTheme();
  }

  Future<void> getData() async {
    try {
      Weather? currentWeather =
      await weatherFactory.currentWeatherByCityName("Tashkent");
      List<Weather> forecast =
      await weatherFactory.fiveDayForecastByCityName("Tashkent");

      setState(() {
        weather = currentWeather;
        hourlyForecast = forecast;
      });
    } catch (e) {
      debugPrint("Error fetching weather data: $e");
    }
  }

  void getTheme() {
    darkMode = CacheService.getBool("dark_mode") ?? false;
  }

  void toggleTheme() {
    darkMode = !darkMode;
    CacheService.saveBool("dark_mode", darkMode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: darkMode ? Colors.black : AppColors.c47BFDF,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: darkMode ? Colors.black : AppColors.c47BFDF,
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    if (weather == null || hourlyForecast.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return Column(
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.location,
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 13.h),
              Text(
                "Tashkent",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: toggleTheme,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2)
                ),
                icon: Icon(
                  darkMode ? Icons.sunny : Icons.shield_moon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.h),
            ],
          ),
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: PageView(
            children: [
              for (int index = 0; index < 2; index++)
                WeatherItem(weather: weather!, forecast: hourlyForecast),
            ],
          ),
        ),
      ],
    );
  }
}
