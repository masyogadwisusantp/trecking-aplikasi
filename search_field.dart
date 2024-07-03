import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:trecking_cuaca/pages/result.dart';

// ignore: camel_case_types
class searchfield extends StatefulWidget {
  const searchfield({super.key});

  @override
  State<searchfield> createState() => _searchfieldState();
}

// ignore: camel_case_types
class _searchfieldState extends State<searchfield> {
  TextEditingController placecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Trecking cuaca",
                style: TextStyle(color: Color.fromRGBO(78, 235, 104, 1)),
              ),
              backgroundColor: const Color.fromRGBO(7, 30, 70, 1),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },child: const Icon(Icons.arrow_back,color: Colors.white,),

              ),
            ),
            body: Center(
                child: Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(hintText: "ex: Jakarta"),
                    controller: placecontroller,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Result(
                            place: placecontroller.text,
                          );
                        }));
                        // ignore: avoid_print
                        print(placecontroller.text);
                      },
                      child: const Text("Treak",
                          style: TextStyle(
                              color: Colors.black,
                              backgroundColor:
                                  Color.fromARGB(255, 7, 255, 110))))
                ],
              ),
            ))));
  }
}
