import 'package:flutter/material.dart';

import 'main_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int _alpha = 5;
  bool _longAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              opacity: _alpha / 10.0,
              duration: Duration(milliseconds: _longAnimation ? 5000 : 500),
              curve: _longAnimation ? Curves.bounceInOut : Curves.easeInOutSine,
              child: const Image(
                fit: BoxFit.fill,
                image: NetworkImage(MainPage.imageUrl),
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(height: 160),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  if (_alpha == 10) return;
                  _longAnimation = false;
                  setState(() => _alpha++);
                },
                onLongPress: () {
                  if (_alpha == 10) return;
                  _longAnimation = true;
                  setState(() => _alpha = 10);
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  child: _text('Add alpha'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  if (_alpha == 0) return;
                  _longAnimation = false;
                  setState(() => _alpha--);
                },
                onLongPress: () {
                  if (_alpha == 0) return;
                  _longAnimation = true;
                  setState(() => _alpha = 0);
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  child: _text('Remove alpha'),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _text(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
