import 'facade/facade.dart';

main() {
  var facade = CacheFacade(fileName: '../patterns/bin/facade/cache/cache.txt');
  facade.interactCache();
}
