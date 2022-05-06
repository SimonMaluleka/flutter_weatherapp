class WeatherReport {
  final int id;
  final String stateName;
  final String stateAbr;
  final String windDirectionCompass;
  final String created;
  final String applicableDate;
  final String minTemp;
  final String maxTemp;
  final String theTemp;
  final String windSpeed;
  final String windDirection;
  final int airPressure;
  final int humidity;
  final String visibility;
  final int predictability;

  const WeatherReport(
      {this.id = 0,
      this.stateName = '',
      this.stateAbr = '',
      this.windDirectionCompass = '',
      this.created = '',
      this.applicableDate = '',
      this.minTemp = '',
      this.maxTemp = '',
      this.theTemp = '',
      this.windSpeed = '',
      this.windDirection = '',
      this.airPressure = 0,
      this.humidity = 0,
      this.visibility = '',
      this.predictability = 0});

  factory WeatherReport.fromJson(List<dynamic> json) =>
      WeatherReport(id: json[0]["woeid"]);

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //     };
}

class WeatherReportList {
  final Map<String, dynamic> weatherReportList;

  //final List<WeatherReport> weatherReportList;

  WeatherReportList({required this.weatherReportList});

  factory WeatherReportList.fromJson(Map<String, dynamic> json) {
    //print(json);
    return WeatherReportList(weatherReportList: json);
  }
}
