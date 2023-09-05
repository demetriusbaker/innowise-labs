import 'dart:math';

import 'package:list_work/model/user.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_name_generator/random_name_generator.dart';

List<User> generateUsers([int usersCount = 30, Zone? zone]) {
  final random = Random();
  final randomNames = RandomNames(zone ?? Zone.us);
  return List.generate(usersCount, (index) {
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
      List.generate(len, (index) => random.nextInt(33) + 89));
}
