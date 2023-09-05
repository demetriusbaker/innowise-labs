import 'package:flutter/material.dart';
import 'package:list_work/data/store.dart';
import 'package:list_work/widgets/user_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final users = generateUsers();
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        return UserCard(user: users[index]);
      },
    );
  }
}
