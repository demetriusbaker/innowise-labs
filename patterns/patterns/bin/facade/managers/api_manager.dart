import 'dart:io';

import 'user_manager.dart';

class ApiManager implements UserManager {
  @override
  String type = 'API manager';

  @override
  void cache(File file) {
    print(type);

    print("Write your name");
    String name = stdin.readLineSync() ?? "Unknown";
    String cache = "($name|${DateTime.now()})";

    file.writeAsStringSync(cache);

    print("Cache was saved!");
  }
}
