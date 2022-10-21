import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class SunWeatherItem extends StatelessWidget {
  const SunWeatherItem({
    Key? key,
    required this.dtOfSunrise,
    required this.dtOfSunset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: MyColors.c2C79C1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                "Sunrise & Sunset",
                style: MyFonts.w400.copyWith(
                  fontSize: 16.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        MyIcons.sunrise,
                        height: 100,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Sunrise",
                        style: MyFonts.w500.copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                dtOfSunrise * 1000)),
                        style: MyFonts.w400.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  Image.asset(
                    MyIcons.circleLoading,
                    height: 40,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        MyIcons.sunset,
                        height: 100,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Sunset",
                        style: MyFonts.w500.copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        DateFormat.Hm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                dtOfSunset * 1000)),
                        style: MyFonts.w400.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final int dtOfSunrise;
  final int dtOfSunset;
}
