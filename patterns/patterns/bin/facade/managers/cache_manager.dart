import 'dart:io';

import 'user_manager.dart';

class CacheManager implements UserManager {
  @override
  String type = 'Cache manager';

  @override
  void cache(File file) {
    print(type);

    var contents = file.readAsStringSync();
    if (contents.isEmpty) {
      print("There has no cache data!");
    } else {
      print(contents);
    }
  }

  void clearCache(File file) {
    file.writeAsStringSync('');
  }
}
