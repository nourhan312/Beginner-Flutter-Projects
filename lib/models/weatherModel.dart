class weatherModel {
  final String city;
  final String country;
  final double minTemp;
  final double maxTemp;
  final double currTemp;
  final String condition;
  final String date;
  final List<NextDays> allNext;

  weatherModel({
    required this.city,
    required this.country,
    required this.minTemp,
    required this.currTemp,
    required this.condition,
    required this.allNext,
    required this.maxTemp,
    required this.date,
  });

  factory weatherModel.fromJson(Map<String, dynamic> json) {
    return weatherModel(
      country: json['location']['country'],
      city: json['location']['name'],
      minTemp:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
      currTemp:
          json['forecast']['forecastday'][0]['day']['avgtemp_c'].toDouble(),
      maxTemp:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      date: json['forecast']['forecastday'][0]['date'],
      allNext: (json['forecast']['forecastday'] as List)
          .map((day) => NextDays.fromJson(day))
          .toList(),
    );
  }
}

class NextDays {
  final double minTemp;
  final double maxTemp;
  final String weatherState;
  final String date;

  NextDays({
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.date,
  });

  factory NextDays.fromJson(Map<String, dynamic> json) {
    return NextDays(
      minTemp: json['day']['mintemp_c'].toDouble(),
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      weatherState: json['day']['condition']['text'],
      date: json['date'],
    );
  }
}
