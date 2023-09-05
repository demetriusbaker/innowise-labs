class User {
  final String firstName;
  final String lastName;
  final int age;
  final Gender sex;
  final String squareAvatarUrl;
  final String description;

  const User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.sex,
    required this.squareAvatarUrl,
    required this.description,
  });
}

enum Gender { male, female }
