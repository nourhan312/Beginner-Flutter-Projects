class WeatherAssets {
  static String getImage(String weatherStateName) {
    if (weatherStateName == "Sunny" || weatherStateName == "Clear") {
      return 'assets/clear.png';
    } else if (weatherStateName == "Partly Cloudy " ||
        weatherStateName == "Cloudy" ||
        weatherStateName == "Overcast" ||
        weatherStateName == "Mist" ||
        weatherStateName == 'Thundery outbreaks in nearby') {
      return 'assets/heavy_cloud.png';
    } else if (weatherStateName == "Patchy rain possible" ||
        weatherStateName == 'Patchy light rain' ||
        weatherStateName == 'Light rain' ||
        weatherStateName == 'Moderate rain at times' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Light rain shower' ||
        weatherStateName == 'Patchy rain nearby' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/light_rain.png';
    } else if (weatherStateName == "Patchy snow possible" ||
        weatherStateName == "Patchy sleet possible" ||
        weatherStateName == "Patchy freezing drizzle possible" ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName == 'Blizzard' ||
        weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Freezing drizzle' ||
        weatherStateName == 'Heavy freezing drizzle' ||
        weatherStateName == 'Light freezing rain' ||
        weatherStateName == 'Moderate or heavy freezing rain' ||
        weatherStateName == 'Light sleet' ||
        weatherStateName == 'Moderate or heavy sleet' ||
        weatherStateName == 'Patchy light snow' ||
        weatherStateName == 'Light snow' ||
        weatherStateName == 'Patchy moderate snow' ||
        weatherStateName == 'Moderate snow' ||
        weatherStateName == 'Patchy heavy snow' ||
        weatherStateName == 'Heavy snow' ||
        weatherStateName == 'Ice pellets' ||
        weatherStateName == 'Light sleet showers' ||
        weatherStateName == 'Moderate or heavy sleet showers' ||
        weatherStateName == 'Light snow showers' ||
        weatherStateName == 'Moderate or heavy snow showers' ||
        weatherStateName == 'Light showers of ice pellets' ||
        weatherStateName == 'Moderate or heavy showers of ice pellets' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy snow with thunder') {
      return 'assets/snow.png';
    } else if (weatherStateName == "Fog" ||
        weatherStateName == 'Patchy light drizzle' ||
        weatherStateName == 'Light drizzle') {
      return 'assets/thunderstorm.png';
    } else if (weatherStateName == 'Heavy rain at times' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Moderate or heavy rain shower' ||
        weatherStateName == 'Torrential rain shower' ||
        weatherStateName == 'Moderate or heavy rain with thunder') {
      return 'assets/heavy_rain.png';
    } else if (weatherStateName == 'Hail') {
      return 'assets/hail.png';
    } else if (weatherStateName == 'Showers') {
      return 'assets/showers.png';
    } else {
      return 'assets/clear.png';
    }
  }
}
