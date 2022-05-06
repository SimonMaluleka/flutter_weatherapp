import 'package:flutter/material.dart';
import '../model/weather_report.dart';

final GlobalKey<_WeatherInfoListState> weatherInfoList = GlobalKey<_WeatherInfoListState>();


class WeatherInfoList extends StatefulWidget {
  WeatherInfoList({Key? key}) : super(key: key);

  @override
  State<WeatherInfoList> createState() => _WeatherInfoListState();
}

class _WeatherInfoListState extends State<WeatherInfoList> {
  late Future<WeatherReportList> _weatherReportList;

  String get formTextValue = _formTextValue; 

  String _formTextValue = '44418';

  set formTextValue(String value){
    setState((){
      _formTextValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            child: FutureBuilder<WeatherReportList>(
              future: _weatherReportList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data =
                      snapshot.data?.weatherReportList['consolidated_weather'];
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Image.network(
                                  "https://www.metaweather.com/static/img/weather/ico/" +
                                      data[index]['weather_state_abbr'] +
                                      ".ico"),
                              title: const Text('London'),
                              subtitle: Text(data[index]['weather_state_name']),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Max: " +
                                          data[index]['max_temp']
                                              .round()
                                              .toString() +
                                          ' ${String.fromCharCode(0x00B0)}C',
                                      style: const TextStyle(fontSize: 18)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "Min: " +
                                          data[index]['min_temp']
                                              .round()
                                              .toString() +
                                          ' ${String.fromCharCode(0x00B0)}C',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ));
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          );
  }
}