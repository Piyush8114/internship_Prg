import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internship/service/api_splash_service.dart';
import 'package:internship/signup.dart';

import 'model/Splash_device_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();

    _sendDeviceDetails().then((response) {
      if (response) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      } else {
        print('API call failed');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _sendDeviceDetails() async {
    // Creating an instance of DeviceInfo
    DeviceInfo deviceInfo = DeviceInfo(
      deviceType: "andriod",
      deviceId: "C6179909526098",
      deviceName: "Samsung-MT200",
      deviceOSVersion: "2.3.6",
      deviceIPAddress: "11.433.445.66",
      lat: 9.9312,
      long: 76.2673,
      buyerGcmid: "",
      buyerPemid: "",
      app: AppInfo(
        version: "1.20.5",
        installTimeStamp: "2022-02-10T12:33:30.696Z",
        uninstallTimeStamp: "2022-02-10T12:33:30.696Z",
        downloadTimeStamp: "2022-02-10T12:33:30.696Z",
      ),
    );

    // Call the API using the ApiService
    return await _apiService.sendDeviceDetails(deviceInfo);
  }
}
