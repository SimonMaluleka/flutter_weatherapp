import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/form.dart';
import 'package:weatherapp/widgets/weather_info_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: const <Widget>[
              SizedBox(height: 20.0),
              WeatherRequestForm(),
              //WeatherInfoList(),
            ],
          ),
        ),
      ),
    );
  }
}
