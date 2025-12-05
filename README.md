<img width="588" height="1226" alt="image" src="https://github.com/user-attachments/assets/5b99aa9d-9d80-4ce9-a153-02023b30302c" />
<img width="582" height="844" alt="image" src="https://github.com/user-attachments/assets/51092774-6257-4d0c-b579-437c8bb5aeb5" />
<img width="586" height="1199" alt="image" src="https://github.com/user-attachments/assets/ba7c861c-8b41-4421-adde-ec8682706b0f" />
<img width="580" height="715" alt="image" src="https://github.com/user-attachments/assets/6b9f5a11-8136-4b5d-be09-0874b98a6fcd" />
<img width="582" height="963" alt="image" src="https://github.com/user-attachments/assets/3d6716f4-900c-411d-8021-bf25ed19a2ab" />

# weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

#  Weather App 🌦️

A multi-page Flutter application that provides real-time weather data using the OpenWeatherMap API. 
Designed with a focus on clean architecture, state management (Provider), and local storage.

## 📱 Features

* **Real-Time Weather:** Fetches current data (Temp, Humidity, Wind, Sunrise/Sunset).
* **Smart Search:** Defaults to **Alexandria, Egypt** on startup.
* **Favorites System:** Save your favorite cities locally (persists after closing the app).
* **Settings:** Toggle between Metric (°C) and Imperial (°F) units.
* **Error Handling:** Graceful handling of invalid cities and network errors.

##  Technical Stack

* **Framework:** Flutter & Dart
* **API:** [OpenWeatherMap Current Weather Data](https://openweathermap.org/current)
* **State Management:** `provider`
* **Networking:** `http`
* **Local Storage:** `shared_preferences`
* **Date Formatting:** `intl`

##  Project Structure

The project follows a strict separation of concerns: 
lib/ ├── models/ # Data models (Weather class parsing JSON) ├── pages/ # UI Screens (Home, Details, Favorites, Settings) ├── providers/ # State Management logic (ChangeNotifier) ├── services/ # API calls and Error handling ├── widgets/ # Reusable UI components └── main.dart # App entry point

## 🚀 Getting Started

Follow these instructions to run the project on your local machine.

### 1. Prerequisites
* Flutter SDK installed ([Guide](https://flutter.dev/docs/get-started/install))
* An IDE (VS Code or Android Studio)
* An API Key from [OpenWeatherMap](https://openweathermap.org/)


3. 🔑 API Configuration (Important)
For security reasons, the API key is not hardcoded in the repository. You must add it manually to run the app.

Open the file: lib/services/weather_service.dart

Locate the apiKey variable at the top of the class.

Replace the placeholder with your key:

Dart

// lib/services/weather_service.dart

class WeatherService {
  // REPLACE THIS STRING with your actual API Key
  static const String apiKey = 'YOUR_OPENWEATHER_API_KEY_HERE'; 
  
  // ... rest of the code
}

 Installation

Clone the repository and install dependencies:

```bash
git clone [https://github.com/YOUR_USERNAME/weather_app.git](https://github.com/YOUR_USERNAME/weather_app.git)
cd weather_app
flutter pub get

3. 🔑 API Configuration (Important)
For security reasons, the API key is not hardcoded in the repository. You must add it manually to run the app.

Open the file: lib/services/weather_service.dart

Locate the apiKey variable at the top of the class.

Replace the placeholder with your key:

Dart

// lib/services/weather_service.dart

class WeatherService {
  // REPLACE THIS STRING with your actual API Key
  static const String apiKey = 'YOUR_OPENWEATHER_API_KEY_HERE'; 
  
  // ... rest of the code
}




