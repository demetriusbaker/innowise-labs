import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Design, task 1'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(
            color: const Color.fromRGBO(172, 172, 172, 1),
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _initRect(const Color.fromRGBO(174, 82, 222, 1), bottom: 25),
              _initRect(const Color.fromRGBO(248, 57, 47, 1), bottom: 25),
              _initRect(const Color.fromRGBO(245, 196, 0, 1), bottom: 25),
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Sending Message"),
                  ),
                ),
                child: _initRect(
                  const Color.fromRGBO(49, 186, 83, 1),
                  child: const Center(
                    child: Text(
                      'Button',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _initRect(Color color, {double bottom = .0, Widget? child}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        color: color,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: child,
      ),
    );
  }
}
