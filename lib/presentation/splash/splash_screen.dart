import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presentation/home/home_screen.dart';
import 'package:weather_app/utils/my_colors.dart';
import 'package:weather_app/utils/my_fonts.dart';
import 'package:weather_app/utils/my_icons.dart';
import 'package:location/location.dart';
import '../../db/shared_preferences/local_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  late LocationData _locationData;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 4, milliseconds: 400));
    await StorageRepository.getInstance();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    if (_locationData.latitude != null && _locationData.longitude != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            lat: _locationData.latitude!,
            long: _locationData.longitude!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                MyIcons.splashLottie,
                repeat: false,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Weather App",
                style: MyFonts.w700.copyWith(
                  color: MyColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}