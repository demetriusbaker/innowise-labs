import 'dart:math';

import '../builders/builder.dart';
import '../coffee/coffee_type.dart';
import '../components/ingridients.dart';
import '../components/syrop_type.dart';

class Director {
  void cookCappucino(Builder builder) {
    builder.chooseCoffeeVariety('Liberica');
    builder.prepareCoffeeBase(CoffeeType.cappucino);
    builder.addExtraIngridients(Ingridient.cream);
    builder.addExtraIngridients(Ingridient.sugar);
    builder.addSyrop(SyropType.cinnamon);
  }

  void cookAmericano(Builder builder) {
    builder.chooseCoffeeVariety('Excelsa');
    builder.prepareCoffeeBase(CoffeeType.americano);
    builder.addExtraIngridients(Ingridient.water);
    builder.addExtraIngridients(Ingridient.sugar);
    builder.addSyrop(SyropType.banana);
  }

  void cookExpresso(Builder builder) {
    builder.chooseCoffeeVariety('Arabica');
    builder.prepareCoffeeBase(CoffeeType.expresso);
    builder.addExtraIngridients(Ingridient.sugar);
    builder.addSyrop(SyropType.nuts);
  }

  void cookLatte(Builder builder) {
    builder.chooseCoffeeVariety('Robusta');
    builder.prepareCoffeeBase(CoffeeType.latte);
    builder.addExtraIngridients(Ingridient.cream);
    builder.addExtraIngridients(Ingridient.sugar);
    builder.addExtraIngridients(Ingridient.water);
    builder.addSyrop(SyropType.chocolate);
  }

  void cookRandom(Builder builder) {
    builder.chooseCoffeeVariety('Stenophylla');
    builder.prepareCoffeeBase(CoffeeType.random);

    List<Ingridient> ingridients = [
      Ingridient.cream,
      Ingridient.sugar,
      Ingridient.water,
    ];
    for (var ingridient in ingridients) {
      if (_random(2) == 1) {
        builder.addExtraIngridients(ingridient);
      }
    }

    List<SyropType?> syrops = [
      null,
      SyropType.banana,
      SyropType.chocolate,
      SyropType.cinnamon,
      SyropType.nuts,
    ];
    builder.addSyrop(syrops[_random(syrops.length)]);
  }

  int _random(int max) {
    Random random = Random();
    return random.nextInt(max);
  }
}
