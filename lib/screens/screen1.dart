// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:wheather_app/screens/screen2.dart';

// class Screen1 extends StatefulWidget {
//   // final weatherdata; // 🟢 ADDED

//   const Screen1({super.key});

//   @override
//   State<Screen1> createState() => _Screen1State();
// }

// class _Screen1State extends State<Screen1> {
//   var apikey = '199b32dd519e4f1f8cb8bf88e2816140';
//   var cityName;
//   var currentWeather;
//   var tempinCel;
//   var cityWhearther;
//   var emoji = '☁️';

//   @override
//   void initState() {
//     super.initState();
//     WheatherDataFromCityname("Tiruppur");
//     print(" this is data :  $widget.weatherdata");
//   }

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('images/screen1.jpeg'),
//           ),
//         ),

//         child: SafeArea(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       print("object");
//                       // UpdateUI(widget.weatherdata);
//                       // weatherdata['weather'][0]['main']
//                       WheatherDataFromCityname(
//                         cityName ?? "Tiruppur",
//                       ); // ✅ Correct
//                     },
//                     icon: Icon(Icons.near_me, color: Colors.white, size: 30),
//                   ),
//                   // SizedBox(width: 10),
//                   IconButton(
//                     onPressed: () async {
//                       var cityname = await Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => Screen2()),
//                       );
//                       print(cityname);
//                       if (cityname != null || cityname.toString().isNotEmpty) {
//                         // var weatherData = WheatherDataFromCityname(
//                         //   cityname.toString(),
//                         // );
//                         WheatherDataFromCityname(cityname.toString());
//                       }
//                     },
//                     icon: Icon(
//                       Icons.location_on,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 cityName ?? "Loading...",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                 ),
//               ),
//               Text(
//                 tempinCel != null ? "$tempinCel°C" : "--°C",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     emoji,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 70,
//                     ),
//                   ),
//                   SizedBox(width: 40),
//                   Text(
//                     "$currentWeather",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String kelvintocel(var temp) {
//     var tempinCel = temp - 273.15;
//     String tempinString = tempinCel.floor().toString();
//     return tempinString;
//   }

//   void WheatherDataFromCityname(String CityName) async {
//     var cityweatherapi =
//         'https://api.openweathermap.org/data/2.5/weather?q=${CityName}&appid=199b32dd519e4f1f8cb8bf88e2816140';

//     print(" this is city weather data :  $cityweatherapi");

//     var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
//       'q': CityName,
//       'appid': apikey,
//     });
//     print(url);
//     var response = await http.get(url);
//     var data = response.body;
//     var weatherdata = jsonDecode(data);
//     var cityName = weatherdata['name'];
//     print(" this is weatherdataasdasdasd :  $weatherdata");
//     print(" this is Citynameasdasdasd :  $cityName");
//     if (weatherdata == null ||
//         weatherdata['weather'] == null ||
//         weatherdata['main'] == null ||
//         weatherdata['name'] == null) {
//       print("❌ Invalid response: $data");
//       return;
//     }
//     UpdateUI(weatherdata);
//   }

//   void UpdateUI(dynamic weatherdata) {
//     if (weatherdata == null) {
//       print("⚠️ weatherdata is null, skipping UI update");
//       return;
//     }

//     if (weatherdata['weather'] == null ||
//         weatherdata['main'] == null ||
//         weatherdata['name'] == null) {
//       print("⚠️ Invalid weather data: $weatherdata");
//       return;
//     }

//     var weatherId = weatherdata['weather'][0]['id'];
//     print("This is weatherid is : $weatherdata");
//     String newEmoji = '☁️';
//     print("weatherId is $weatherId");
//     if (weatherId >= 200 && weatherId < 300) {
//       newEmoji = '⛈️';
//     } else if (weatherId >= 300 && weatherId < 400) {
//       newEmoji = '🌧️';
//     } else if (weatherId >= 500 && weatherId < 600) {
//       newEmoji = '🌦️';
//     } else if (weatherId >= 600 && weatherId < 700) {
//       // 🔴 FIXED range
//       newEmoji = '🌨️';
//     } else if (weatherId == 800) {
//       newEmoji = '☀️';
//     } else if (weatherId > 800) {
//       newEmoji = '☁️';
//     }
//     setState(() {
//       emoji = newEmoji;
//       tempinCel = kelvintocel(weatherdata['main']['temp']);
//       currentWeather = weatherdata['weather'][0]['main'];
//       cityName = weatherdata['name'];
//     });
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/screens/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var apikey = '199b32dd519e4f1f8cb8bf88e2816140';
  var cityName;
  var currentWeather;
  var tempinCel;
  var emoji = '☁️';

  @override
  void initState() {
    super.initState();
    WheatherDataFromCityname("Tiruppur"); // ✅ default city
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/screen1.jpeg'),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      WheatherDataFromCityname(
                        cityName ?? "Tiruppur",
                      ); // ✅ Correct
                    },
                    icon: Icon(Icons.near_me, color: Colors.white, size: 30),
                  ),
                  IconButton(
                    onPressed: () async {
                      var cityname = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Screen2()),
                      );
                      if (cityname != null && cityname.toString().isNotEmpty) {
                        WheatherDataFromCityname(
                          cityname.toString(),
                        ); // ✅ Correct
                      }
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Text(
                cityName ?? "Loading...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                tempinCel != null ? "$tempinCel°C" : "--°C",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    emoji,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                  SizedBox(width: 40),
                  Text(
                    "$currentWeather",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String kelvintocel(var temp) {
    var tempinCel = temp - 273.15;
    return tempinCel.floor().toString();
  }

  Future<void> WheatherDataFromCityname(String CityName) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': CityName,
      'appid': apikey,
    });
    print("🔍 Fetching: $url");

    var response = await http.get(url);
    var data = jsonDecode(response.body);

    if (data == null ||
        data['weather'] == null ||
        data['main'] == null ||
        data['name'] == null) {
      print("❌ Invalid response: ${response.body}");
      return;
    }

    UpdateUI(data);
  }

  void UpdateUI(dynamic weatherdata) {
    if (weatherdata == null) return;

    var weatherId = weatherdata['weather'][0]['id'];
    String newEmoji = '';
    if (weatherId >= 200 && weatherId < 300)
      newEmoji = '⛈️';
    else if (weatherId >= 300 && weatherId < 400)
      newEmoji = '🌧️';
    else if (weatherId >= 500 && weatherId < 600)
      newEmoji = '🌦️';
    else if (weatherId >= 600 && weatherId < 700)
      newEmoji = '🌨️';
    else if (weatherId == 800)
      newEmoji = '☀️';
    else if (weatherId > 800)
      newEmoji = '☁️';

    setState(() {
      emoji = getWeatherEmoji(weatherId);
      tempinCel = kelvintocel(weatherdata['main']['temp']);
      currentWeather = weatherdata['weather'][0]['main'];
      cityName = weatherdata['name'];
    });
  }

  String getWeatherEmoji(int weatherId) {
    if (weatherId >= 200 && weatherId < 300) return '⛈️'; // Thunderstorm
    if (weatherId >= 300 && weatherId < 400) return '🌧️'; // Drizzle
    if (weatherId >= 500 && weatherId < 600) return '🌦️'; // Rain
    if (weatherId >= 600 && weatherId < 700) return '🌨️'; // Snow
    if (weatherId >= 700 && weatherId < 800) return '🌫️'; // Atmosphere
    if (weatherId == 800) return '☀️'; // Clear
    if (weatherId == 801) return '🌤️'; // Few clouds
    if (weatherId == 802) return '⛅'; // Scattered clouds
    if (weatherId == 803) return '🌥️'; // Broken clouds
    if (weatherId == 804) return '☁️'; // Overcast
    return '❓';
  }
}
