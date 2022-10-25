import '../coffee/coffee.dart';
import '../export/index.dart';
import 'builder.dart';

class CoffeeBuilder implements Builder {
  List<Ingridient> ingridients = [];
  SyropType? syrop;
  late final String variety;
  late final CoffeeType coffee;

  @override
  void addExtraIngridients(Ingridient ingridient) {
    ingridients.add(ingridient);
  }

  @override
  void addSyrop(SyropType? type) {
    syrop = type;
  }

  @override
  void chooseCoffeeVariety(String variety) {
    this.variety = variety;
  }

  @override
  void prepareCoffeeBase(CoffeeType type) {
    coffee = type;
  }

  Coffee getCoffee() {
    return Coffee(variety, coffee, ingridients, syrop);
  }
}
