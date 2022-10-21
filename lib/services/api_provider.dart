import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:weather_app/models/current_weather/top_level_current_weather/top_level_current_weather.dart';
import 'package:weather_app/models/daily_hourly_weather/top_level_daily_hourly_weather/top_level_daily_hourly_weather.dart';
import 'package:weather_app/utils/my_constants.dart';

class ApiProvider {
  static Future<TopLevelCurrentWeather> getCurrentWeatherByCity(
      {required String searchedCity}) async {
    try {
      var queryParametres = {
        "appid": MyConstants.apiKey,
        "q": searchedCity,
      };
      Response response = await https.get(
        Uri.https(MyConstants.baseUrl, "/data/2.5/weather", queryParametres),
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return TopLevelCurrentWeather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<TopLevelCurrentWeather> getCurrentWeatherByCoord({
    required double lat,
    required double long,
  }) async {
    try {
      var queryParametres = {
        "lat": lat.toString(),
        "lon": long.toString(),
        "appid": MyConstants.apiKey,
      };
      Response response = await https.get(
        Uri.https(MyConstants.baseUrl, "/data/2.5/weather", queryParametres),
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return TopLevelCurrentWeather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<TopLevelDailyHourlyWeather> getDailyHourlyWeatherByCordinates(
      {required double lat, required double lon}) async {
    try {
      var queryParametres = {
        "lat": lat.toString(),
        "lon": lon.toString(),
        "appid": MyConstants.apiKey,
        "exclude": "minutely,current",
        "units": "metric",
      };
      Response response = await https.get(
        Uri.https(MyConstants.baseUrl, "/data/2.5/onecall", queryParametres),
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        TopLevelDailyHourlyWeather data =
            TopLevelDailyHourlyWeather.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
