import '../transport.dart';

class Car extends Transport {
  Car({
    required String companyName,
    required double limitLoadCapacity,
    required double limitCargoDimension,
  }) : super(
          companyName: companyName,
          limitLoadCapacity: limitLoadCapacity,
          limitCargoDimension: limitCargoDimension,
        );

  @override
  void deliver() {
    print('🚛\t' * 10);
  }
}