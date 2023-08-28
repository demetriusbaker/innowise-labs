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
      title: 'Design 4',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double mainSize = MediaQuery.of(context).size.width * 0.73;
    double cornerSize = MediaQuery.of(context).size.width * 0.12;
    double innerCornerSize = cornerSize / 2;
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(239, 49, 36, 1.0),
        width: mainSize,
        height: mainSize,
        child: Stack(
          children: [
            Center(
              child: Container(
                color: const Color.fromRGBO(170, 102, 204, 1.0),
                width: cornerSize,
                height: cornerSize,
              ),
            ),
            Container(
              color: const Color.fromRGBO(153, 204, 0, 1.0),
              width: cornerSize,
              height: cornerSize,
            ),
            Align(
              alignment: const Alignment(-1, 1),
              child: Container(
                color: const Color.fromRGBO(51, 181, 229, 1.0),
                width: cornerSize,
                height: cornerSize,
              ),
            ),
            Align(
              alignment: const Alignment(1, -1),
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 1.0),
                width: cornerSize,
                height: cornerSize,
                child: Align(
                  alignment: const Alignment(1, -1),
                  child: Container(
                    color: const Color.fromRGBO(255, 136, 0, 1.0),
                    width: innerCornerSize,
                    height: innerCornerSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
