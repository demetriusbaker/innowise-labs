import 'delivery_type.dart';
import 'transport.dart';

main() {
  for (var delivery in DeliveryType.values) {
    print("========" * 10);
    Transport transport = Transport.createTransport(delivery);
    print(transport);
    transport.deliver();
    print("========" * 10);
  }
}
