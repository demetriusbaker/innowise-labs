import '../transport.dart';

class Plane extends Transport {
  final String flightType;
  final String transportType;

  Plane({
    required String companyName,
    required double limitLoadCapacity,
    required double limitCargoDimension,
    required this.flightType,
    required this.transportType,
  }) : super(
          companyName: companyName,
          limitLoadCapacity: limitLoadCapacity,
          limitCargoDimension: limitCargoDimension,
        );

  @override
  void deliver() {
    print('Flight type: $flightType;');
    print('Transport type: $transportType;');
    print('🛩\t' * 10);
  }
}