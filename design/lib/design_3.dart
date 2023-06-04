import 'package:flutter/material.dart';

void main() {
  runApp(const DesignApp());
}

class DesignApp extends StatelessWidget {
  const DesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DesignPage(),
      ),
    );
  }
}

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            color: const Color.fromRGBO(255, 175, 70, 1.0),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          Container(
            color: const Color.fromRGBO(255, 12, 1, 1.0),
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width * 0.51,
          ),
          Container(
            color: const Color.fromRGBO(120, 99, 255, 1.0),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.24,
          ),
        ],
      ),
    );
  }
}
