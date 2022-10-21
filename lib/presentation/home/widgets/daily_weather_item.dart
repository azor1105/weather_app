import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_hourly_weather/daily/daily_model.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class DailyWeatherItem extends StatelessWidget {
  const DailyWeatherItem({
    Key? key,
    required this.iconUrl,
    required this.dailyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: Text(
              DateFormat.E().format(
                DateTime.fromMillisecondsSinceEpoch(
                  (dailyWeather.dt).toInt() * 1000,
                ),
              ),
              style: MyFonts.w500.copyWith(fontSize: 16.sp),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Row(
              children: [
                CachedNetworkImage(imageUrl: iconUrl),
                Text(
                  "Clouds: ${dailyWeather.clouds}",
                  style: MyFonts.w400.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      (dailyWeather.temp.day).toStringAsFixed(0),
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
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "/",
                  style: MyFonts.w400.copyWith(fontSize: 12.sp),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      dailyWeather.feelsLike.day.toStringAsFixed(0),
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
          ),
        ),
      ],
    );
  }

  final String iconUrl;
  final DailyModel dailyWeather;
}
