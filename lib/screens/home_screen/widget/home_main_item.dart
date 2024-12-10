import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/images/app_images.dart';

class HomeMainItem extends StatelessWidget {
  const HomeMainItem({super.key, required this.gradus, required this.aboutTemp, required this.wind, required this.hum, required this.data});
  final String gradus;
  final String aboutTemp;
  final String wind;
  final String hum;
  final String data;

  @override
  Widget build(BuildContext context) {
    List<String> temp = gradus.toString().split(" ");

    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            color : Colors.white.withOpacity(0.3),
            border : Border.all(
                width: 2,
                color : Colors.white.withOpacity(0.5)
            ),
            borderRadius: BorderRadius.circular(16.r)
        ),
        child : Column(
          children: [
            Text(data , style: TextStyle(
                color : Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500
            ),),
            Text("${temp[0]}°" , style: TextStyle(
                color : Colors.white,
                fontSize: 80.sp,
                fontWeight: FontWeight.w500
            ),),
            Text(aboutTemp , style: TextStyle(
                color : Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.wind , width: 24.w, fit : BoxFit.cover,),
                SizedBox(width: 15.w,),
                Text("Wind" , style: TextStyle(
                    color : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 16.w),
                Container(
                  width: 2.w,
                  height : 15.h,
                  decoration: BoxDecoration(
                    color : Colors.white,
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                ),
                SizedBox(width: 16.w),
                Text("$wind km/h" , style: TextStyle(
                    color : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.water, width: 24.w, fit : BoxFit.cover,),
                SizedBox(width: 15.w,),
                Text("Hum" , style: TextStyle(
                    color : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 16.w),
                Container(
                  width: 2.w,
                  height : 15.h,
                  decoration: BoxDecoration(
                      color : Colors.white,
                      borderRadius: BorderRadius.circular(5.r)
                  ),
                ),
                SizedBox(width: 16.w),
                Text("$hum %" , style: TextStyle(
                    color : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),),
              ],
            ),
          ],
        )
    );
  }
}
