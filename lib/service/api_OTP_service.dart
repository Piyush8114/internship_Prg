// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/otp_verification_model.dart';

class ApiService {
  final String _url = 'http://devapiv4.dealsdray.com/api/v2/user/otp/verification';

  Future<bool> verifyOtp(OtpVerificationRequest otpRequest) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(otpRequest.toJson()),
      );

      if (response.statusCode == 200) {
        print('OTP verified successfully: ${response.body}');
        return true;
      } else {
        print('Failed to verify OTP: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error during OTP verification: $error');
      return false;
    }
  }
}
