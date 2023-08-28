import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _value = 0.0;
  final _size = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: _size,
                  height: _size,
                  child: const CircularProgressIndicator(
                    strokeWidth: 15,
                    value: 1,
                    color: Color.fromRGBO(123, 156, 159, 1),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: _size,
                  height: _size,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: _value / 100),
                    duration: const Duration(milliseconds: 700),
                    builder: (context, value, _) => CircularProgressIndicator(
                      strokeWidth: 30,
                      value: value,
                      color: const Color.fromRGBO(44, 123, 129, 1),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: _size / 2.3),
                  child: Text(
                    _value.toInt().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(44, 123, 129, 1)),
            ),
            onPressed: () {
              setState(() {
                _value = Random().nextInt(101).toDouble();
              });
            },
            child: const Text("Animate with random value"),
          ),
        ],
      ),
    );
  }
}
