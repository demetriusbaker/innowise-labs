import 'dart:async';

import 'package:flutter/material.dart';
import 'package:observer/observer/weather_observable.dart';
import 'package:observer/observer/weather_observer.dart';
import 'package:observer/pages/second_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late WeatherObserver _observer;
  late Observable _maker;

  Stream<int>? stream;
  StreamSubscription<int>? streamSubscription;

  int celcium = 0;

  @override
  void initState() {
    super.initState();
    _updateValue();
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
    _maker.unsubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Center(
            child: Text('The weather is $celcium degrees celcium'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              title: widget.title,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'prev',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateValue() {
    _observer = WeatherObserver();
    _maker = Observable();
    _maker.subscribe(_observer);

    Duration duration = const Duration(microseconds: 5000000);
    stream = Stream.periodic(duration, (_) => _).asBroadcastStream();
    streamSubscription = stream?.listen((event) {
      setState(() => celcium = _observer.update());
      print('From the third screen. Celcium = $celcium');
    });
  }
}
