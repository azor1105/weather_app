import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/db/shared_preferences/local_data.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/my_constants.dart';

class UtilityFunctions {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.c2C79C1,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String capitalize(String word) {
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  static String get4xImage({required String iconName}) {
    return "https://openweathermap.org/img/wn/$iconName@4x.png";
  }

  static String get2xImage({required String iconName}) {
    return "https://openweathermap.org/img/wn/$iconName@2x.png";
  }

  static String getSmallerFormatOfImage({required String iconName}) {
    return "https://openweathermap.org/img/wn/$iconName.png";
  }

  static bool addIfNotExist({required String city}) {
    List<String> cities =
        StorageRepository.getStringList(key: MyConstants.listOfCities) ?? [];
    for (int i = 0; i < cities.length; i++) {
      if (city == cities[i]) {
        return false;
      }
    }

    cities.add(city);
    StorageRepository.putStringList(
        list: cities, key: MyConstants.listOfCities);
    return true;
  }

  static bool isExist({required dynamic name, required List data}) {
    for (int i = 0; i < data.length; i++) {
      if (name == data[i]) {
        return true;
      }
    }

    return false;
  }
}
