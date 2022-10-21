import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_hourly_weather/hourly/hourly_model.dart';
import 'package:weather_app/utils/my_fonts.dart';
import 'package:weather_app/utils/my_icons.dart';
import 'package:weather_app/utils/utility_functions.dart';

class HourlyItemWeather extends StatelessWidget {
  HourlyItemWeather({
    Key? key,
    required this.dateTime,
    required this.hourly,
  }) : super(key: key);
  final DateTime nowTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      height: 104.h,
      width: 72.w,
      child: Column(
        children: [
          Text(
            nowTime.hour == dateTime.hour &&
                    nowTime.day == dateTime.day &&
                    nowTime.year == dateTime.year
                ? "Now"
                : DateFormat.Hm().format(dateTime),
            style: MyFonts.w500.copyWith(fontSize: 16.sp),
          ),
          CachedNetworkImage(
            imageUrl: UtilityFunctions.getSmallerFormatOfImage(
                iconName: hourly.weather.first.icon),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    "${hourly.temp.toInt()}",
                    style: MyFonts.w400.copyWith(fontSize: 12.sp),
                  ),
                  Positioned(
                    right: -5,
                    top: 0,
                    child: SvgPicture.asset(
                      MyIcons.degreeIcon,
                      width: 4,
                      height: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5.w,),
              Text(
                "/",
                style: MyFonts.w400.copyWith(fontSize: 12.sp),
              ),
              SizedBox(width: 3.w,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    hourly.feelsLike.ceil().toInt().toString(),
                    style: MyFonts.w400.copyWith(fontSize: 12.sp),
                  ),
                  Positioned(
                    right: -5,
                    top: 0,
                    child: SvgPicture.asset(
                      MyIcons.degreeIcon,
                      width: 4,
                      height: 4,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "Clouds: ${hourly.clouds}",
            style: MyFonts.w400.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  final DateTime dateTime;
  final HourlyModel hourly;
}
