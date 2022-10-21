import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/db/shared_preferences/local_data.dart';
import 'package:weather_app/models/current_weather/top_level_current_weather/top_level_current_weather.dart';
import 'package:weather_app/models/daily_hourly_weather/top_level_daily_hourly_weather/top_level_daily_hourly_weather.dart';
import 'package:weather_app/presentation/home/loading_screen/loading_screen.dart';
import 'package:weather_app/presentation/search_select/widgets/search_text_field.dart';
import 'package:weather_app/services/api_provider.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/my_constants.dart';
import 'package:weather_app/utils/my_fonts.dart';
import 'package:weather_app/utils/my_icons.dart';

import '../../utils/utility_functions.dart';

class SearchSelectCityScreen extends StatefulWidget {
  const SearchSelectCityScreen({
    Key? key,
    required this.selectedCity,
    required this.listenerCurrentWeather,
    required this.listenerDailyHourlyWeather,
  }) : super(key: key);

  @override
  State<SearchSelectCityScreen> createState() => _SearchSelectCityScreenState();
  final String selectedCity;
  final ValueChanged<TopLevelCurrentWeather> listenerCurrentWeather;
  final ValueChanged<TopLevelDailyHourlyWeather> listenerDailyHourlyWeather;
}

class _SearchSelectCityScreenState extends State<SearchSelectCityScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> cities =
      StorageRepository.getStringList(key: MyConstants.listOfCities) ?? [];
  bool isLoading = false;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _init(String searchedCity) async {
    try {
      isLoading = true;
      setState(() {});
      TopLevelCurrentWeather currentWeather =
          await ApiProvider.getCurrentWeatherByCity(searchedCity: searchedCity);
      TopLevelDailyHourlyWeather dailyHourlyWeather =
          await ApiProvider.getDailyHourlyWeatherByCordinates(
              lat: currentWeather.coord.lat, lon: currentWeather.coord.lon);
      widget.listenerCurrentWeather.call(currentWeather);
      widget.listenerDailyHourlyWeather.call(dailyHourlyWeather);
      if (!UtilityFunctions.isExist(name: searchedCity, data: cities)) {
        UtilityFunctions.addIfNotExist(city: currentWeather.name);
      }
      Navigator.of(context).pop();
    } catch (e) {
      UtilityFunctions.getMyToast(message: "This city not found");
      isLoading = false;
      searchController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: isLoading
          ? const LoadingScreen()
          : SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: MyColors.blueBar,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: SvgPicture.asset(MyIcons.arrowBackIcon),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Manage location",
                            style: MyFonts.w600.copyWith(
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        height: 70.h,
                        child: SearchTextField(
                          searchController: searchController,
                          onSubmitted: (city) {
                            if (searchController.text != '') {
                              _init(searchController.text);
                            } else {
                              UtilityFunctions.getMyToast(
                                  message: "Field is empty");
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        itemCount: cities.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          child: GestureDetector(
                            onTap: () {
                              if (widget.selectedCity != cities[index]) {
                                _init(cities[index]);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cities[index],
                                    style: MyFonts.w400.copyWith(
                                      fontSize: 16.sp,
                                      color: MyColors.c1B2541,
                                    ),
                                  ),
                                  widget.selectedCity == cities[index]
                                      ? Image.asset(
                                          MyIcons.tickIcon,
                                          height: 16,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
