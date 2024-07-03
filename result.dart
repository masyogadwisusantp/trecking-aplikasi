import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  final String place;

  const Result({super.key, required this.place});
 
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Future<Map<String, dynamic>> getDataFromAPI() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${widget.place} &appid=657bf3a3fd6c3e6410b1329fdef8a13e&units=metric"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data;
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Hasil tracking",
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Color.fromRGBO(224, 223, 226, 1)),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: FutureBuilder(
              future: getDataFromAPI(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasData) {
                  final data = snapshot.data!; //non nullable
                  // ignore: avoid_unnecessary_containers
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text(
                          "suhu: ${data["main"]["feels_like"]}C",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Kecepatan Angin: ${data["wind"]["speed"]}m/s',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Negara: ${data["sys"]["country"]}',
                          style: const TextStyle(fontSize: 20),)
                      ],
                    ),
                  );
                } else {
                  return const Text(
                    "Tempat tidak diketahui",
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
          )),
    );
  }
}
