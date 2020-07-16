import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String keyAPI = '0b06ecaf81e78e7cce7cfa4aae3bb567';
const String openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherCity(String cityName) async {
    String url = '$openWeatherURL?q=$cityName&appid=$keyAPI&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
//    print('latitude: ${location.latitude} - longitude ${location.longitude}');

    String url =
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$keyAPI&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
