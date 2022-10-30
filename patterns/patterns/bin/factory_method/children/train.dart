import '../transport.dart';

class Train extends Transport {
  final double trackSize;
  final bool withBallast;

  Train({
    required String companyName,
    required double limitLoadCapacity,
    required double limitCargoDimension,
    required this.trackSize,
    required this.withBallast,
  }) : super(
          companyName: companyName,
          limitLoadCapacity: limitLoadCapacity,
          limitCargoDimension: limitCargoDimension,
        );

  @override
  void deliver() {
    print('Track size: $trackSize (with ballast: $withBallast);');
    print('🚅\t' * 10);
  }
}