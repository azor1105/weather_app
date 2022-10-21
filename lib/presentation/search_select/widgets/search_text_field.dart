import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.searchController,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      style: MyFonts.w400.copyWith(
        fontSize: 12.sp,
        color: MyColors.black,
      ),
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding:
              EdgeInsets.only(left: 16.w, bottom: 8.h, top: 8.h, right: 8.w),
          child: SvgPicture.asset(
            MyIcons.searchIcon,
          ),
        ),
        fillColor: MyColors.white,
        filled: true,
        hintText: "Search Your City",
        hintStyle: MyFonts.w400.copyWith(
          fontSize: 12.sp,
          color: MyColors.c828282,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            width: 3,
            color: MyColors.white,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            width: 3,
            color: MyColors.white,
          ),
        ),
      ),
    );
  }

  final TextEditingController searchController;
  final ValueChanged<String> onSubmitted;
}
