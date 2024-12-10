import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';

class TodayItem extends StatelessWidget {
  const TodayItem({super.key, required this.weather});
  final List<Weather> weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ),
              Text(
                "${DateTime.now().month}/${DateTime.now().day}  ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 20.w),
              ...weather.take(12).map((hour) {
                return Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 15.h),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${hour.temperature?.celsius?.toStringAsFixed(1)}°C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      SvgPicture.asset(
                        "assets/icons/${hour.weatherIcon}.svg",
                        width: 30.w,
                        height: 30.w,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Text(
                        "${hour.date?.hour ?? ''}:00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        )
      ],
    );
  }
}
