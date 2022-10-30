import 'dart:io';

import '../managers/manager.dart';

class CacheFacade {
  final String fileName;

  CacheFacade({required this.fileName}) {
    print('Welcome!');
  }

  void interactCache() {
    File? file = _readFile();
    if (file == null) return;

    bool isCompleted = false;
    while (!isCompleted) {
      print('Choose actions!');
      print('0) Exit');
      print('1) Show cache');
      print('2) Write cache');
      print('3) Clear cache');

      UserManager userManager;
      switch (stdin.readLineSync()) {
        case '0':
          isCompleted = true;
          break;
        case '1':
          userManager = CacheManager();
          userManager.cache(file);
          break;
        case '2':
          userManager = ApiManager();
          userManager.cache(file);
          break;
        case '3':
          userManager = CacheManager();
          (userManager as CacheManager).clearCache(file);
          break;
        default:
          print('Incorrect input!');
          break;
      }
    }
  }

  File? _readFile() {
    File file = File(fileName);
    if (!file.existsSync()) {
      print("This file doesn't exist!");
      return null;
    }
    return file;
  }
}
