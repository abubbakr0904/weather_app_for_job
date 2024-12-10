class WeatherModel {
  CurrentWeather current;
  List<HourlyWeather> hourly;

  WeatherModel({
    required this.current,
    required this.hourly,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      current: CurrentWeather.fromJson(json['current']),
      hourly: (json['hourly'] as List)
          .map((hour) => HourlyWeather.fromJson(hour))
          .toList(),
    );
  }
}

class CurrentWeather {
  double temp;
  String description;

  CurrentWeather({
    required this.temp,
    required this.description,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temp: json['temp'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}

class HourlyWeather {
  double temp;
  String description;
  DateTime time;

  HourlyWeather({
    required this.temp,
    required this.description,
    required this.time,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      temp: json['temp'].toDouble(),
      description: json['weather'][0]['description'],
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}
