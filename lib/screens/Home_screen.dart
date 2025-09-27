import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'screen1.dart';
import 'package:wheather_app/services/location.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      getLocation();
    }
    print("init state caled");
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.latitude;
    double lon = location.longitute;

    var apikey = '199b32dd519e4f1f8cb8bf88e2816140';

    var apiurl =
        'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=$apikey';
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': apikey,
    });
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Screen1();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void initState() {
      // TODO: implement initState
      super.initState();
      print("Build method called");
    }

    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.black, size: 50)),
    );
  }
}
