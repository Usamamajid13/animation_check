import 'dart:async';
import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var progress = 0.0;
  var padding = 0.0;

  startAnimation() {
    Timer.periodic(const Duration(milliseconds: 1), (Timer t) {
      if (progress < 1.00) {
        checkForNewSharedLists();
      } else {
        if (padding < 50) {
          padding = padding + 0.5;
          setState(() {});
        }
      }
    });
  }

  checkForNewSharedLists() {
    progress = progress + 0.005;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: padding * 2.5,
                margin: const EdgeInsets.only(bottom: 10),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  startAnimation();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: padding < 50
                      ? SquarePercentIndicator(
                          width: 40,
                          height: 40,
                          reverse: false,
                          startAngle: StartAngle.bottomRight,
                          borderRadius: 20,
                          shadowWidth: 2,
                          progressWidth: 2,
                          shadowColor: Colors.white,
                          progressColor: Colors.blue,
                          progress: progress,
                          child: const Center(
                              child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                        )
                      : Container(
                    height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
        title: Text(widget.title),
      ),
    );
  }
}
