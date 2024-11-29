import 'dart:convert';
import 'package:dynamic_country_search/res/const/api_end_points/app_urls.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static String baseUrl = AppUrl.baseUrl;

  static Future<List<dynamic>> fetchCountries(String query) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$query'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data;
      } else if (response.statusCode == 404) {
        return []; // No countries found
      } else {
        throw Exception("Failed to fetch countries");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
}
