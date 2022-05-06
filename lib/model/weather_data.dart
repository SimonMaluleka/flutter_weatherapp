// import 'package:flutter/material.dart';

// import '../api/weather_data_service.dart';
// import 'weather_report.dart';

// class WeatherData extends StatefulWidget {
//   const WeatherData({Key? key}) : super(key: key);

//   @override
//   State<WeatherData> createState() => _WeatherDataState();
// }

// class _WeatherDataState extends State<WeatherData> {
//   late Future<WeatherReport> weatherReport;

//   @override
//   void initState() {
//     super.initState();
//     weatherReport = WeatherDataService().getCityID('London');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<WeatherReport>(
//         future: weatherReport,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Text(snapshot.data!.id.toString());
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }

//           // By default, show a loading spinner.
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }
