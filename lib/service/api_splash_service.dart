// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Splash_device_model.dart';

class ApiService {
  final String _url = 'http://devapiv4.dealsdray.com/api/v2/user/device/add';

  Future<bool> sendDeviceDetails(DeviceInfo deviceInfo) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(deviceInfo.toJson()),
      );

      if (response.statusCode == 200) {
        print('API Response: ${response.body}');
        return true;
      } else {
        print('Failed API Response: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error making API call: $error');
      return false;
    }
  }
}
