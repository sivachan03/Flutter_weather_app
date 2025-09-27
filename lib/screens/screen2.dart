import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController CityNameController = TextEditingController();
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
            image: AssetImage('images/screen2.jpeg'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: CityNameController,
                decoration: InputDecoration(
                  hintText: "Enter your  City name",
                  hintStyle: TextStyle(fontSize: 24),
                  fillColor: Colors.white,
                  filled: true,
                  // labelText: "City Name",fsdfsf
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print("object");
                    Navigator.pop(context, CityNameController.text);
                  },
                  child: Text(
                    "Get Weather",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
