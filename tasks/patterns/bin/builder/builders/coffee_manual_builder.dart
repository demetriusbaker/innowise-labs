import '../coffee/manual.dart';
import '../export/index.dart';
import 'builder.dart';

class CoffeeManualBuilder implements Builder {
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

  Manual getManual() {
    return Manual(variety, coffee, ingridients, syrop);
  }
}
