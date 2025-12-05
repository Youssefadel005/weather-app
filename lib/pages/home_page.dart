import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'details_page.dart';
import 'favorites_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesPage())),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              "Search for a City",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter City Name (e.g., Cairo)',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchAndNavigate(context, _controller.text),
                ),
              ),
              onSubmitted: (value) => _searchAndNavigate(context, value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Quick shortcut to go back to Alexandria
                _searchAndNavigate(context, "Alexandria,EG");
              },
              child: const Text("Show Alexandria Weather"),
            ),
          ],
        ),
      ),
    );
  }

  void _searchAndNavigate(BuildContext context, String city) {
    if (city.isNotEmpty) {
      Provider.of<WeatherProvider>(context, listen: false).searchCity(city);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsPage()));
    }
  }
}