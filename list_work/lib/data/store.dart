import 'dart:math';

import 'package:flutter/material.dart';
import 'package:list_work/model/article.dart';
import 'package:list_work/model/user.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_name_generator/random_name_generator.dart';

List<User> generateUsers([int usersCount = 30, Zone? zone]) {
  final random = Random();
  final randomNames = RandomNames(zone ?? Zone.us);
  return List.generate(usersCount, (_) {
    final gender = random.nextInt(2) > 0 ? Gender.male : Gender.female;
    return User(
      firstName: gender == Gender.male
          ? randomNames.manName()
          : randomNames.womanName(),
      lastName: randomNames.surname(),
      age: random.nextInt(22) + 18,
      sex: gender,
      squareAvatarUrl:
          RandomAvatarString(_generateRandomString(random.nextInt(100) + 1)),
      description: _generateRandomString(random.nextInt(35) + 15),
    );
  });
}

String _generateRandomString(int len) {
  final random = Random();
  return String.fromCharCodes(
      List.generate(len, (_) => random.nextInt(33) + 89));
}

List<Article> generateArticles() {
  const size = 20;
  return List.generate(size, (index) {
    return Article(
      title: _articleNames[index % _articleNames.length],
      backgroundColor: _articleColor[index % _articleColor.length],
      icon: _articleIcons[index % _articleIcons.length],
    );
  });
}

List<String> _articleNames = [
  'My doctor',
  'My caremanager',
  'My diagnosis',
  'Therapy plan',
  'Remaining pills',
  'My orders',
];

List<Color> _articleColor = [
  const Color.fromRGBO(241, 241, 246, 1),
  const Color.fromRGBO(117, 219, 234, 1),
  const Color.fromRGBO(0, 41, 75, 1),
  const Color.fromRGBO(243, 130, 79, 1),
  Colors.amber,
  Colors.cyan,
];

List<IconData?> _articleIcons = [
  Icons.person_outline,
  Icons.local_pharmacy_outlined,
  Icons.note_add_outlined,
  Icons.health_and_safety_outlined,
  Icons.border_color_outlined,
  null,
];
