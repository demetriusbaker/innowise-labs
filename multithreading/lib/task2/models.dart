class Ship {
  final String name;
  final Product product;
  final Capacity capacity;

  Ship({required this.name, required this.product, required this.capacity}) {
    switch (capacity) {
      case Capacity.small:
        _capacity = 10;
      case Capacity.medium:
        _capacity = 50;
      case Capacity.large:
        _capacity = 100;
    }
  }

  double _capacity = 0, _currentFilling = 0;

  double get currentSize => _currentFilling;

  void fill(double units) {
    if (units <= _capacity - _currentFilling) {
      _currentFilling = units;
    }
  }

  @override
  String toString() {
    return 'Ship $name {Product type: ${product.name}, Capacity: $_capacity, Current filling: $_currentFilling}';
  }
}

class Berth {
  final Product product;

  const Berth(this.product);

  @override
  String toString() {
    return 'Berth {Product type: ${product.name}}';
  }
}

enum Capacity {
  small, medium, large,
}

enum Product {
  bread, banana, clothes,
}