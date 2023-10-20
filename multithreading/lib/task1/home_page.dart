import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int _counter = 0;
  static const int _task1Time = 1, _task2Time = 10, _task3Show = 4;

  ReceivePort? _port1, _port2, _port3;
  Isolate? _isolate1, _isolate2, _isolate3;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() async {
    _port1 = ReceivePort();
    _port2 = ReceivePort();
    _port3 = ReceivePort();

    await _startThreads();

    _listenEvents();
  }

  Future<void> _startThreads() async {
    _isolate1 = await Isolate.spawn(
      (arg) {
        Timer.periodic(const Duration(seconds: _task1Time), (_) {
          SendPort? port = arg;
          _counter++;
          port?.send(_counter);
        });
      },
      _port1?.sendPort,
    );
    _isolate2 = await Isolate.spawn(
      (arg) {
        Timer.periodic(const Duration(seconds: _task2Time), (_) {
          SendPort? port = arg;
          port?.send(_counter);
        });
      },
      _port2?.sendPort,
    );
    _isolate3 = await Isolate.spawn(
      (arg) {
        Timer.periodic(const Duration(seconds: _task2Time * _task3Show), (_) {
          SendPort? port = arg;
          port?.send("Surprise");
        });
      },
      _port3?.sendPort,
    );
  }

  void _listenEvents() {
    _port1?.listen((count) {
      setState(() {
        _counter = count;
      });
    });
    _port2?.listen((message) {
      String? text;
      if (_counter % (_task2Time * _task3Show) != 0) {
        text = 'Time: $_counter';
      } else if (message is String) {
        text = message;
      }

      if (text != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message is String ? message : 'Time: $_counter'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
    _port3?.listen((_) {
      _port2?.sendPort.send(_);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(height: 5),
            const Text('You have watches time:'),
            const SizedBox(height: 5),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _port1?.close();
    _port2?.close();
    _port3?.close();
    _isolate1?.kill();
    _isolate1 = null;
    _isolate2?.kill();
    _isolate2 = null;
    _isolate3?.kill();
    _isolate3 = null;
    super.dispose();
  }
}
