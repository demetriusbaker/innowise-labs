import 'package:flutter/material.dart';

import 'main_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                children: [
                  for (int i = 0; i < _count; i++)
                    const Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(MainPage.imageUrl),
                      width: 300,
                      height: 300,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _count++;
                  });
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  child: _text('Add'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (_count > 0) _count--;
                  });
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  child: _text('Remove'),
                ),
              ),
            ),
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
