
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _service = WeatherService();
  
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isMetric = true;
  List<String> _favorites = [];

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isMetric => _isMetric;
  List<String> get favorites => _favorites;

  WeatherProvider() {
    _loadFavorites();
    // Start with your city automatically!
    searchCity("Alexandria,EG");
  }

  Future<void> searchCity(String city) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _weather = await _service.fetchWeather(city, _isMetric);
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleUnit() {
    _isMetric = !_isMetric;
    if (_weather != null) {
      searchCity(_weather!.cityName);
    }
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList('favorites') ?? [];
    notifyListeners();
  }

  Future<void> toggleFavorite(String city) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favorites.contains(city)) {
      _favorites.remove(city);
    } else {
      _favorites.add(city);
    }
    await prefs.setStringList('favorites', _favorites);
    notifyListeners();
  }

  bool isFavorite(String city) {
    return _favorites.contains(city);
  }
}