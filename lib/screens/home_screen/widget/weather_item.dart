import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/home_screen/widget/home_main_item.dart';
import 'package:weather_app/screens/home_screen/widget/next_forecast_item.dart';
import 'package:weather_app/screens/home_screen/widget/today_item.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({super.key, required this.weather, required this.forecast});
  final Weather weather;
  final List<Weather> forecast;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset(
          "assets/icons/${weather.weatherIcon}.svg",
          width: 200.w,
          height: 200.w,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        SizedBox(
          height: 30.h,
        ),
        HomeMainItem(
          gradus: weather.tempFeelsLike.toString(),
          aboutTemp: weather.weatherMain.toString(),
          wind: weather.windSpeed.toString(),
          hum: weather.humidity.toString(),
          data:
          "${weather.date!.day.toString()}.${weather.date!.month.toString()}.${weather.date!.year.toString()}",
        ),
        SizedBox(
          height: 20.h,
        ),
        TodayItem(
          weather: forecast,
        ),
        SizedBox(
          height: 20.h,
        ),
        NextForecastItem(
          weather: forecast,
        )
      ],
    );
  }
}
