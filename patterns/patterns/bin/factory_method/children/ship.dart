import '../transport.dart';

class Ship extends Transport {
  final String waterType;

  Ship({
    required String companyName,
    required double limitLoadCapacity,
    required double limitCargoDimension,
    required this.waterType,
  }) : super(
          companyName: companyName,
          limitLoadCapacity: limitLoadCapacity,
          limitCargoDimension: limitCargoDimension,
        );

  @override
  void deliver() {
    print('Water type: $waterType;');
    print('🚢\t' * 10);
  }
}
