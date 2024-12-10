import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/utils/images/app_images.dart';

class NextForecastItem extends StatelessWidget {
  const NextForecastItem({super.key, required this.weather});
  final List<Weather> weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Next Forecast",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ),
              SvgPicture.asset(AppImages.calendar,
                  width: 24.w, fit: BoxFit.cover),
            ],
          ),
          SizedBox(height: 12.h),
          ...List.generate(weather.length, (index) {
            var dailyWeather = weather[index];
            var day = dailyWeather.date?.day ?? 0;
            var month = dailyWeather.date?.month ?? 0;
            var icon = dailyWeather.weatherIcon ?? '';
            var temp = dailyWeather.tempFeelsLike?.toString() ?? 'N/A';

            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 1.w,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$day.$month",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                  icon.isNotEmpty
                      ? SvgPicture.asset(
                    "assets/icons/$icon.svg",
                    width: 30.w,
                    height: 30.w,
                    colorFilter: const ColorFilter.mode(Colors.white , BlendMode.srcIn),
                  )
                      : const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                  ),
                  Text(
                    "$temp°C",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
