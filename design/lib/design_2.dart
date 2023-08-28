import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ContainerData> items = [];

  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: _fits() ? const NeverScrollableScrollPhysics() : null,
            children: [
              for (final i in items)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: i.height,
                    color: i.color,
                  ),
                ),
              if (!_fits()) Center(child: _button(100))
            ],
          ),
          if (_fits())
            Align(
              alignment: Alignment.bottomCenter,
              child: _button(),
            ),
        ],
      ),
    );
  }

  Widget _button([double? height]) {
    return InkWell(
      onTap: _addItem,
      onLongPress: _clearItems,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.75,
        color: const Color.fromRGBO(0, 255, 0, 1),
        child: const Center(
          child: Text(
            "Button",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  void _addItem() {
    final random = Random();
    final height = random.nextDouble() * 150.0 + 50;
    final color = colors[random.nextInt(colors.length)];
    items.add(ContainerData(color, height));
    setState(() {});
  }

  void _clearItems() {
    items.clear();
    setState(() {});
  }

  bool _fits() {
    return MediaQuery.of(context).size.height * 0.89 >
        ContainerData.getTotalHeight(items);
  }
}

class ContainerData {
  final Color color;
  final double height;

  const ContainerData(this.color, this.height);

  static double getTotalHeight(List<ContainerData> items) {
    double total = 0.0;
    for (final i in items) {
      total += i.height;
    }
    return total;
  }
}
