import 'builders/coffee_builder.dart';
import 'builders/coffee_manual_builder.dart';
import 'coffee/coffee.dart';
import 'coffee/manual.dart';
import 'director/director.dart';

main() {
  Director director = Director();

  for (int i = 0; i < 5; i++) {
    showAllCoffee(director, i);
  }
}

void showAllCoffee(Director director, int position) {
  CoffeeBuilder coffeeBuilder = CoffeeBuilder();
  CoffeeManualBuilder coffeeManualBuilder = CoffeeManualBuilder();

  switch (position) {
    case 0:
      director.cookAmericano(coffeeBuilder);
      director.cookAmericano(coffeeManualBuilder);
      break;
    case 1:
      director.cookCappucino(coffeeBuilder);
      director.cookCappucino(coffeeManualBuilder);
      break;
    case 2:
      director.cookExpresso(coffeeBuilder);
      director.cookExpresso(coffeeManualBuilder);
      break;
    case 3:
      director.cookLatte(coffeeBuilder);
      director.cookLatte(coffeeManualBuilder);
      break;
    default:
      director.cookRandom(coffeeBuilder);
      director.cookRandom(coffeeManualBuilder);
      break;
  }

  Coffee coffee = coffeeBuilder.getCoffee();
  Manual manual = coffeeManualBuilder.getManual();

  print('Coffee type: ${coffee.coffee.name}');
  print('Full manual');
  print('$manual');
}
