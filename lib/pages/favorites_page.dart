import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'details_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    final favorites = provider.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite cities yet.\nGo back and add some!'))
          : ListView.separated(
              itemCount: favorites.length,
              separatorBuilder: (ctx, i) => const Divider(),
              itemBuilder: (context, index) {
                final city = favorites[index];
                return ListTile(
                  title: Text(city, style: const TextStyle(fontSize: 18)),
                  leading: const Icon(Icons.location_city, color: Colors.blue),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    provider.searchCity(city);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsPage()));
                  },
                );
              },
            ),
    );
  }
}