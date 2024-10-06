import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/homePage_model.dart';

class ApiService {
  final String _url = 'http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice';

  Future<HomeResponse?> fetchHomeData() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return HomeResponse.fromJson(jsonResponse);
      } else {
        print('Failed to load home data');
        return null;
      }
    } catch (error) {
      print('Error fetching home data: $error');
      return null;
    }
  }
}
