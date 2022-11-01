class WeatherObserver {
  static final WeatherObserver _observer = WeatherObserver._internal();

  factory WeatherObserver() => _observer;

  WeatherObserver._internal();

  int update() => DateTime.now().microsecond % 35;
}
