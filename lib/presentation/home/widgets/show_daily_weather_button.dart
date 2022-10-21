import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/my_icons.dart';

import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

class ShowDailyWeatherButton extends StatelessWidget {
  const ShowDailyWeatherButton({
    Key? key,
    required this.onPressed,
    required this.showDailyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Forcats for 7 Days",
            style: MyFonts.w500.copyWith(
              fontSize: 16.sp,
              color: MyColors.c2C79C1,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Image.asset(
            !showDailyWeather ? MyIcons.downShowIcon : MyIcons.upHideIcon,
          ),
        ],
      ),
    );
  }

  final VoidCallback onPressed;
  final bool showDailyWeather;
}
