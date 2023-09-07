import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  int get label => _sharedPrefs?.getInt('_label') ?? 0;

  set labelValue(int value) {
    _sharedPrefs?.setInt('_label', value);
  }
}