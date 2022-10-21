import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/my_fonts.dart';

class IndicatorItem extends StatelessWidget {
  const IndicatorItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 32, width: 32, color: MyColors.white,),
        SizedBox(
          width: 4.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: MyFonts.w400.copyWith(fontSize: 12.sp),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              subTitle,
              style: MyFonts.w400.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }

  final String iconPath;
  final String title;
  final String subTitle;
}
