import 'children/car.dart';
import 'children/train.dart';
import 'children/plane.dart';
import 'children/ship.dart';
import 'delivery_type.dart';

abstract class Transport {
  final String companyName;
  final double limitLoadCapacity;
  final double limitCargoDimension;

  Transport({
    required this.companyName,
    required this.limitLoadCapacity,
    required this.limitCargoDimension,
  });

  factory Transport.createTransport(DeliveryType deliveryType) {
    switch (deliveryType) {
      case DeliveryType.water:
        return Ship(
          companyName: 'TransAtlanticInternational',
          limitLoadCapacity: 965.46,
          limitCargoDimension: 123.34,
          waterType: 'sea',
        );
      case DeliveryType.railway:
        return Train(
          companyName: "BzhD company",
          limitLoadCapacity: 382.3,
          limitCargoDimension: 50.2,
          trackSize: 1520,
          withBallast: true,
        );
      case DeliveryType.air:
        return Plane(
            companyName: "Boing International Flight",
            limitLoadCapacity: 134.6,
            limitCargoDimension: 26.7,
            flightType: 'international',
            transportType: 'freighter');
      case DeliveryType.automobile:
        return Car(
          companyName: "Google car",
          limitLoadCapacity: 19.3,
          limitCargoDimension: 6.122,
        );
    }
  }

  void deliver();

  @override
  String toString() => '''
Company name: $companyName;
Max load capacity: $limitLoadCapacity;
Max cargo dimension: $limitCargoDimension;
  ''';
}
