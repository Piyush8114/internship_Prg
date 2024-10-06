import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internship/signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _sendDeviceDetails().then((response) {
      // Navigate to the next screen after API response
      if (response) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      } else {
        // Handle API failure (optional)
        print('API call failed');
      }
    }).catchError((error) {
      // Handle error
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo at the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for your app logo
                // Image.asset('assets/logo.png', width: 200, height: 200),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to send device details API call
  Future<bool> _sendDeviceDetails() async {
    // API URL
    final String url = 'http://devapiv4.dealsdray.com/api/v2/user/device/add';

    // Device info payload
    Map<String, dynamic> deviceInfo = {
      "deviceType": "andriod",
      "deviceId": "C6179909526098",
      "deviceName": "Samsung-MT200",
      "deviceOSVersion": "2.3.6",
      "deviceIPAddress": "11.433.445.66",
      "lat": 9.9312,
      "long": 76.2673,
      "buyer_gcmid": "",
      "buyer_pemid": "",
      "app": {
        "version": "1.20.5",
        "installTimeStamp": "2022-02-10T12:33:30.696Z",
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
      }
    };

    try {
      // Send POST request to the API
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(deviceInfo),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // API call succeeded
        print('API Response: ${response.body}');
        return true;
      } else {
        // API call failed
        print('Failed API Response: ${response.body}');
        return false;
      }
    } catch (error) {
      // Handle error during the request
      print('Error making API call: $error');
      return false;
    }
  }
}
