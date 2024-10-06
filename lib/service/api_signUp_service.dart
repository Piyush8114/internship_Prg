// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/signup_model.dart';

class ApiService {
  final String _url = 'http://devapiv4.dealsdray.com/api/v2/user/email/referral';

  Future<bool> signUp(SignUpData signUpData) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(signUpData.toJson()),
      );

      if (response.statusCode == 200) {
        print('Sign Up Successful: ${response.body}');
        return true;
      } else {
        print('Sign Up Failed: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error during sign-up: $error');
      return false;
    }
  }
}
