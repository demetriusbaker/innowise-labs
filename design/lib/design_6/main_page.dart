import 'package:design/design_6/first_page.dart';
import 'package:design/design_6/second_page.dart';
import 'package:design/design_6/third_page.dart';
import 'package:flutter/material.dart';

enum Screen { first, second, third }

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const imageUrl =
      'https://c4.wallpaperflare.com/wallpaper/246/739/689/digital-digital-art-artwork-illustration-abstract-hd-wallpaper-preview.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _screenButton(
                context,
                Screen.first,
                const Color.fromRGBO(174, 82, 222, 1),
              ),
              const SizedBox(height: 10),
              _screenButton(
                context,
                Screen.second,
                const Color.fromRGBO(248, 57, 47, 1),
              ),
              const SizedBox(height: 10),
              _screenButton(
                context,
                Screen.third,
                const Color.fromRGBO(49, 186, 83, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _screenButton(BuildContext context, Screen screen, Color color) {
    return GestureDetector(
      onTap: () {
        Widget widget = const SizedBox();
        switch (screen) {
          case Screen.first:
            widget = const FirstPage();
            break;
          case Screen.second:
            widget = const SecondPage();
            break;
          case Screen.third:
            widget = const ThirdPage();
            break;
        }

        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return widget;
        }));
      },
      child: _initRect(
        MediaQuery.of(context).size.width,
        color,
        child: Center(
          child: Text(
            '${screen.name} screen',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _initRect(double size, Color color,
      {double bottom = .0, Widget? child}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        color: color,
        width: size,
        height: 50,
        child: child,
      ),
    );
  }
}
