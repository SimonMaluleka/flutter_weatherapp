import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weatherapp/model/weather_report.dart';
import 'dart:async';

const baseUrl = "https://www.metaweather.com/api/location/";

class WeatherDataService {
  Future<WeatherReport> getCityID(String cityName) async {
    final response =
        await http.get(Uri.parse(baseUrl + "search/?query=$cityName"));
    if (response.statusCode == 200) {
      return WeatherReport.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('No city ID information found');
    }
  }

  Future<WeatherReportList> getCityForecastById(String cityId) async {
    final response = await http.get(Uri.parse(baseUrl + cityId));
    if (response.statusCode == 200) {
      //print(convert.jsonDecode(response.body));
      return WeatherReportList.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('No city information found');
    }
  }
}
