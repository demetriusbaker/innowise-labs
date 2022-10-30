import '../export/index.dart';

class Manual {
  late final List<Ingridient> ingridients;
  SyropType? syrop;
  late final String variety;
  late final CoffeeType coffee;

  Manual(this.variety, this.coffee, this.ingridients, this.syrop);

  @override
  String toString() {
    return '''
Variety of coffee: $variety
Coffee type: ${coffee.name}
Ingridients: $ingridients
Syrop: ${syrop?.name}
''';
  }
}
