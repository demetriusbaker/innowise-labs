import 'dart:async';

import 'package:app_lifecycle/shared_preferences/shared_preferences.dart';
import 'package:app_lifecycle/pages/update_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> with WidgetsBindingObserver {
  int _label = 0;
  Timer? _timer;

  @override
  void initState() {
    _label = SharedPrefs().label;

    SystemChannels.lifecycle.setMessageHandler((mode) async {
      if (mode == '${AppLifecycleState.resumed}') {
        _label += 2;
        SharedPrefs().labelValue = _label;

        _timer?.cancel();

        setState(() {});
      } else if (mode == '${AppLifecycleState.paused}') {
        _label += 5;
        SharedPrefs().labelValue = _label;

        _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
          if (_label <= 0) {
            timer.cancel();
            _label = 0;
          } else {
            _label -= 2;
          }
          SharedPrefs().labelValue = _label;
        });
      }
      return mode;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final squareSize = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      body: Center(
        child: Container(
          width: squareSize,
          height: squareSize,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(_label.toDouble()),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 5),
                  Text('$_label', style: const TextStyle(fontSize: 16)),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      final value = await Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                        return UpdateCounter(count: _label);
                      }));

                      if (!mounted) return;

                      if (value is int) {
                        setState(() {
                          _label = value;
                          SharedPrefs().labelValue = value;
                        });
                      }
                    },
                    child: Container(
                      width: squareSize / 3,
                      height: squareSize / 3,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'Tap',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
