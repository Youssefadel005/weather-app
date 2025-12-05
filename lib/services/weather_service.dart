import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  
  static const String apiKey = '9f4a707cc8f85415ecca3bc84e9a994c'; 
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city, bool isMetric) async {
    final units = isMetric ? 'metric' : 'imperial';
    
    // Logic to ensure we find Alexandria, Egypt if the user just types "Alexandria"
    // If the user types "Alexandria", we force it to "Alexandria,EG"
    String query = city;
    if (city.toLowerCase() == 'alexandria') {
      query = 'Alexandria,EG';
    }

    final url = Uri.parse('$baseUrl?q=$query&units=$units&appid=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('City not found');
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}