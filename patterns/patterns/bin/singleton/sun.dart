class Star {
  @override
  String toString() => 'Hashcode: ${hashCode.toString()}';
}

class Sun {
  static final Sun _sun = Sun._private();

  factory Sun() => _sun;

  Sun._private();

  @override
  String toString() => 'Hashcode: ${_sun.hashCode.toString()}';
}

main() {
  Star star1 = Star();
  Star star2 = Star();
  print('Star one: $star1');
  print('Star two: $star2');
  print('star 1 equals star 2? ${star1 == star2 ? 'Yes' : 'No'}!');
  print("============");
  Sun sun = Sun();
  print(sun);
  Sun duplicateSun = Sun();
  print(duplicateSun);
  print('sun equals duplicateSun? ${sun == duplicateSun ? 'Yes' : 'No'}!');
}
