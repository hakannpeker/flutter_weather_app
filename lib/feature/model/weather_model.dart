class WeatherInfo {
  final String? description;
  final String? icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double? temperature;
  final double? tempMin;
  final double? tempMax;

  TemperatureInfo({this.tempMin, this.tempMax, this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'].toDouble();
    final tempMin = json["temp_min"].toDouble();
    final tempMax = json["temp_max"].toDouble();
    return TemperatureInfo(temperature: temperature, tempMin: tempMin, tempMax: tempMax);
  }
}

class WindInfo {
  final double? speed;
  final int? deg;

  WindInfo({this.speed, this.deg});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    final deg = json['deg'];
    return WindInfo(speed: speed, deg: deg);
  }
}

class WeatherResponse {
  final String? cityName;
  final TemperatureInfo? tempInfo;
  final WeatherInfo? weatherInfo;
  final WindInfo? windInfo;
  final String? country;
  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo?.icon}@2x.png';
  }

  WeatherResponse({this.windInfo, this.cityName, this.tempInfo, this.weatherInfo, this.country});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final country = json['country'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json["wind"];
    final windInfo = WindInfo.fromJson(windInfoJson);

    return WeatherResponse(
      cityName: cityName,
      tempInfo: tempInfo,
      weatherInfo: weatherInfo,
      windInfo: windInfo,
      country: country,
    );
  }
}
