import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List work',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(104, 0, 244, 1),
          selectedItemColor: Color.fromRGBO(242, 231, 254, 1),
          unselectedItemColor: Color.fromRGBO(184, 137, 247, 1),
        ),
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(background: Colors.grey[300]),
      ),
      home: const Menu(),
    );
  }
}
