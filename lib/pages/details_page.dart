
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/weather_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;
    final unitSymbol = weatherProvider.isMetric ? '°C' : '°F';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        actions: [
          if (weather != null)
            IconButton(
              icon: Icon(
                weatherProvider.isFavorite(weather.cityName) ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => weatherProvider.toggleFavorite(weather.cityName),
            ),
        ],
      ),
      body: Center(
        child: weatherProvider.isLoading
            ? const CircularProgressIndicator()
            : weatherProvider.errorMessage != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(weatherProvider.errorMessage!, 
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 18)),
                  )
                : weather == null
                    ? const Text('No data found.')
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(weather.cityName, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Image.network('https://openweathermap.org/img/wn/${weather.iconCode}@4x.png'),
                            Text('${weather.temperature.toStringAsFixed(1)}$unitSymbol', 
                                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                            Text(weather.description.toUpperCase(), 
                                style: const TextStyle(fontSize: 20, letterSpacing: 1.2)),
                            const Divider(height: 40, thickness: 1, indent: 40, endIndent: 40),
                            _buildDetailRow('Feels Like', '${weather.feelsLike}$unitSymbol'),
                            _buildDetailRow('Humidity', '${weather.humidity}%'),
                            _buildDetailRow('Wind Speed', '${weather.windSpeed} ${weatherProvider.isMetric ? 'm/s' : 'mph'}'),
                            _buildDetailRow('Sunrise', _formatTime(weather.sunrise)),
                            _buildDetailRow('Sunset', _formatTime(weather.sunset)),
                          ],
                        ),
                      ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  String _formatTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('hh:mm a').format(date);
  }
}