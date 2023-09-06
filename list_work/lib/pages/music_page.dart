import 'package:flutter/material.dart';
import 'package:list_work/data/store.dart';
import 'package:list_work/widgets/user_card.dart';
import 'package:random_name_generator/random_name_generator.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    final users = generateUsers(30, Zone.brazil);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        return UserCard(
          user: users[index],
          height: 88,
          squareAvatar: true,
          includeDescription: true,
        );
      },
    );
  }
}
