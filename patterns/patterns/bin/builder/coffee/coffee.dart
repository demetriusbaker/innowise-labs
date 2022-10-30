import '../export/index.dart';

class Coffee {
  late final List<Ingridient> ingridients;
  SyropType? syrop;
  late final String variety;
  late final CoffeeType coffee;

  Coffee(this.variety, this.coffee, this.ingridients, this.syrop);
}
