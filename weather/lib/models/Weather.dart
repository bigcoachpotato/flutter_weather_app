class Weather {
  final String city;
  final int temperature;
  final String icon;
  final String description;
  final DateTime time;

  Weather(
      {this.city, this.temperature, this.icon, this.description, this.time });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['name'],
        temperature: double.parse(json['main']['temp'].toString()).toInt(),
        icon: json['weather'][0]['icon'],
        description: json['weather'][0]['main'],
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
  }
}
