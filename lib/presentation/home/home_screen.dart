import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current_weather/top_level_current_weather/top_level_current_weather.dart';
import 'package:weather_app/models/daily_hourly_weather/top_level_daily_hourly_weather/top_level_daily_hourly_weather.dart';
import 'package:weather_app/presentation/home/loading_screen/loading_screen.dart';
import 'package:weather_app/presentation/home/widgets/daily_weather_item.dart';
import 'package:weather_app/presentation/home/widgets/hourly_weather_item.dart';
import 'package:weather_app/presentation/home/widgets/main_weather_item.dart';
import 'package:weather_app/presentation/home/widgets/show_daily_weather_button.dart';
import 'package:weather_app/presentation/home/widgets/sun_weather_item.dart';
import 'package:weather_app/presentation/search_select/search_select_city_screen.dart';
import 'package:weather_app/services/api_provider.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/my_icons.dart';
import 'package:weather_app/utils/utility_functions.dart';
import '../../utils/my_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  final double lat;
  final double long;
}

class _HomeScreenState extends State<HomeScreen> {
  bool showDailyWeather = false;
  bool isLoadingData = true;
  late double lat;
  late double long;
  late TopLevelCurrentWeather currentWeather;
  late TopLevelDailyHourlyWeather dailyHourlyWeather;
  DateTime? dateTimeOfCurrentWeather;

  @override
  void initState() {
    super.initState();
    lat = widget.lat;
    long = widget.long;
    _init();
  }

  Future<void> _init() async {
    try {
      final datas = await Future.wait([
        ApiProvider.getCurrentWeatherByCoord(lat: lat, long: long),
        ApiProvider.getDailyHourlyWeatherByCordinates(lat: lat, lon: long),
      ]);
      currentWeather = datas[0] as TopLevelCurrentWeather;
      dailyHourlyWeather = datas[1] as TopLevelDailyHourlyWeather;
      dateTimeOfCurrentWeather = DateTime.fromMillisecondsSinceEpoch(
          (currentWeather.dt * 1000).toInt());
      isLoadingData = false;
      UtilityFunctions.addIfNotExist(city: currentWeather.name);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      UtilityFunctions.getMyToast(message: "This city not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: isLoadingData
          ? const LoadingScreen()
          : RefreshIndicator(
              onRefresh: _init,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainWeatherItem(
                          addOnPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchSelectCityScreen(
                                  selectedCity: currentWeather.name,
                                  listenerCurrentWeather: (v) {
                                    currentWeather = v;
                                    lat = currentWeather.coord.lat;
                                    long = currentWeather.coord.lon;
                                    dateTimeOfCurrentWeather =
                                        DateTime.fromMillisecondsSinceEpoch(
                                      currentWeather.dt.toInt() * 1000,
                                    );
                                    setState(() {});
                                  },
                                  listenerDailyHourlyWeather: (v) {
                                    dailyHourlyWeather = v;
                                    setState(() {});
                                  },
                                ),
                              ),
                            );
                          },
                          menuOnPressed: () {},
                          dateTimeOfCurrentWeather: dateTimeOfCurrentWeather!,
                          currentWeather: currentWeather,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 9.h),
                          height: 185.h,
                          decoration:
                              const BoxDecoration(color: MyColors.c2C79C1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Text(
                                  "${DateFormat.EEEE().format(dateTimeOfCurrentWeather!)} | ${DateFormat.MMM().format(dateTimeOfCurrentWeather!)} ${dateTimeOfCurrentWeather!.day}",
                                  style: MyFonts.w400.copyWith(fontSize: 16.sp),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Expanded(
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  children: List.generate(
                                    dailyHourlyWeather.hourly.length,
                                    (index) => HourlyItemWeather(
                                      dateTime:
                                          DateTime.fromMillisecondsSinceEpoch(
                                        dailyHourlyWeather.hourly[index].dt *
                                            1000,
                                      ),
                                      hourly: dailyHourlyWeather.hourly[index],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 90.w),
                          child: ShowDailyWeatherButton(
                            showDailyWeather: showDailyWeather,
                            onPressed: () {
                              setState(() {
                                showDailyWeather = !showDailyWeather;
                              });
                            },
                          ),
                        ),
                        Visibility(
                          visible: showDailyWeather,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            decoration: const BoxDecoration(
                              color: MyColors.c2C79C1,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: dailyHourlyWeather.daily.length - 1,
                              itemBuilder: (contex, index) => SizedBox(
                                height: 48.h,
                                child: DailyWeatherItem(
                                  dailyWeather: dailyHourlyWeather.daily[index],
                                  iconUrl:
                                      UtilityFunctions.getSmallerFormatOfImage(
                                    iconName: dailyHourlyWeather
                                        .daily[index].weather.first.icon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SunWeatherItem(
                          dtOfSunrise: currentWeather.sys.sunRise,
                          dtOfSunset: currentWeather.sys.sunSet,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
