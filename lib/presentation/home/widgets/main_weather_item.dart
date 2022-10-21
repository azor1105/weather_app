import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current_weather/top_level_current_weather/top_level_current_weather.dart';
import 'package:weather_app/presentation/home/widgets/underline.dart';

import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';
import '../../../utils/utility_functions.dart';
import 'indicator_item.dart';

class MainWeatherItem extends StatelessWidget {
  const MainWeatherItem({
    Key? key,
    required this.dateTimeOfCurrentWeather,
    required this.currentWeather,
    required this.addOnPressed,
    required this.menuOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient: const LinearGradient(
          colors: MyColors.blueBar,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: addOnPressed,
                  icon: SvgPicture.asset(MyIcons.addIcon),
                ),
                Text(
                  currentWeather.name,
                  style: MyFonts.w600.copyWith(fontSize: 16.sp),
                ),
                const SizedBox(width: 40,),
              ],
            ),
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: UtilityFunctions.get4xImage(
                iconName: currentWeather.weather.first.icon,
              ),
            ),
          ),
          Center(
            child: Text(
              "${DateFormat.EEEE().format(dateTimeOfCurrentWeather)} | ${DateFormat.MMM().format(dateTimeOfCurrentWeather)} ${dateTimeOfCurrentWeather.day}",
              style: MyFonts.w400.copyWith(fontSize: 16.sp),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  "${(currentWeather.main.temp - 273.15).toInt()}",
                  style: MyFonts.w600.copyWith(fontSize: 72.sp),
                ),
                Positioned(
                  top: 7,
                  right: -10,
                  child: SvgPicture.asset(MyIcons.degreeIcon),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              UtilityFunctions.capitalize(
                  currentWeather.weather.first.description),
              style: MyFonts.w400.copyWith(fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const UnderLine(),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndicatorItem(
                      iconPath: MyIcons.locationIcon,
                      title: "${currentWeather.wind.speed} km/h",
                      subTitle: "Wind",
                    ),
                    SizedBox(height: 24.h),
                    IndicatorItem(
                      iconPath: MyIcons.pressureIcon,
                      title: "${currentWeather.main.pressure} mbar",
                      subTitle: "Pressure",
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndicatorItem(
                      iconPath: MyIcons.cloudIcon,
                      title: "${currentWeather.clouds.all}",
                      subTitle: "Clouds",
                    ),
                    SizedBox(height: 24.h),
                    IndicatorItem(
                      iconPath: MyIcons.humidityIcon,
                      title: "${currentWeather.main.humidity}%",
                      subTitle: "Humidity",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final VoidCallback addOnPressed;
  final VoidCallback menuOnPressed;
  final DateTime dateTimeOfCurrentWeather;
  final TopLevelCurrentWeather currentWeather;
}
