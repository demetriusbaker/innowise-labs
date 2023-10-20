// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';

import 'models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Ship> ships;
  late final List<Berth> berths;
  final List<String> info = [];

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _addItem("Start process\n");
    final random = Random();
    ships = List.generate(10, (index) {
      final ship = Ship(
        name: "Name #${index + 1}",
        product: Product.values[random.nextInt(Product.values.length)],
        capacity: Capacity.values[random.nextInt(Capacity.values.length)],
      );
      _addItem('$ship');
      return ship;
    });
    berths = List.generate(Product.values.length, (index) {
      final berth = Berth(Product.values[index]);
      _addItem('$berth');
      return berth;
    });
    final selectedShips = List<Ship>.generate(5, (index) {
      final index = random.nextInt(ships.length);
      final ship = ships[index];
      ships.removeAt(index);
      return ship;
    });

    _addItem("\nThe list of ships are moving through the tunnel\n");
    selectedShips.forEach((ship) {
      _addItem(ship.name);
    });

    _addItem("\nThis way will take 10 seconds\n", true);
    selectedShips.forEach((ship) {
      _addItem2(ship.name + "WEE-WEE!");
    });
  }

  void _addItem(String argument, [bool pidor = false]) {
    Processor.addArgument(() {
      setState(() {
        info.add(argument);
        controller.jumpTo(controller.position.maxScrollExtent);
      });
    }).then((value) => print("Suck dick"));
  }

  void _addItem2(String argument) {
    Processor.addArgument2(() {
      setState(() {
        info.add(argument);
        controller.jumpTo(controller.position.maxScrollExtent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: info.length,
        itemBuilder: (_, index) {
          return _item(info[index]);
        },
      ),
    );
  }

  Widget _item(String arg) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        arg,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class Processor {
  Processor();

  static final List<Function()> arguments = [];
  static final List<Function()> arguments2 = [];
  static final List<Function()> arguments3 = [];
  static bool start = false, start2 = false;

  static ReceivePort? _port1;
  static Isolate? _isolate1;

  static Future<void> addArgument(Function() argument) async {
    arguments.add(argument);
    if (!start) await _startAction();
  }

  static Future<void> _startAction() async {
    start = true;
    _port1 = ReceivePort();
    _isolate1 = await Isolate.spawn(
      (arg) {
        Timer.periodic(const Duration(milliseconds: 400), (_) {
          SendPort? port = arg;
          port?.send('');
        });
      },
      _port1?.sendPort,
    );
    _port1?.listen((_) {
      if (arguments.isNotEmpty) {
        arguments[0]();
        arguments.removeAt(0);
      } else {
        _finish();
      }
    });
  }

  static void addArgument2(Function() argument) async {
    arguments2.add(argument);
    _moveShip();
  }

  static Future<void> _moveShip() async {
    start2 = true;
    final port = ReceivePort();
    Isolate? isolate;
    isolate = await Isolate.spawn(
      (message) {
        Timer.periodic(const Duration(seconds: 1), (_) {
          SendPort? port = message;
          port.send('');
        });
      },
      port.sendPort,
    );
    port.listen((message) {
      if (arguments2.isNotEmpty) {
        arguments2[0]();
        arguments2.removeAt(0);
      } else {
        port.close();
        isolate?.kill();
        isolate = null;
        start2 = false;
      }
    });
  }

  static void _finish() {
    arguments.clear();
    start = false;

    _port1?.close();
    _isolate1?.kill();
    _isolate1 = null;
  }
}
