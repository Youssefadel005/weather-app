
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Temperature Unit'),
              subtitle: Text(provider.isMetric ? 'Metric (°C)' : 'Imperial (°F)'),
              trailing: Switch(
                value: provider.isMetric,
                onChanged: (value) {
                  provider.toggleUnit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}