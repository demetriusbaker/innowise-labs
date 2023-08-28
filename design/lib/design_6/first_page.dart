import 'package:flutter/material.dart';

import 'main_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _hidden
                ? const Text('Hidden')
                : const Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(MainPage.imageUrl),
                    width: 300,
                    height: 300,
                  ),
            const SizedBox(height: 160),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  setState(() => _hidden = true);
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  child: _text('Hide'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  setState(() => _hidden = false);
                },
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  child: _text('Show'),
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
