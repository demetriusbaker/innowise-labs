import 'package:observer/observer/weather_observer.dart';

class Observable {
  WeatherObserver? observer;

  static final Observable _observable = Observable._internal();

  factory Observable() => _observable;

  Observable._internal();

  void subscribe(WeatherObserver observer){
    this.observer = observer;
  }

  void unsubscribe() {
    observer = null;
  }

  int notify() => observer?.update() ?? 0;
}