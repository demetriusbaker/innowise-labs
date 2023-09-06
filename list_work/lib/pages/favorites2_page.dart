import 'package:flutter/material.dart';
import 'package:list_work/data/store.dart';
import 'package:list_work/widgets/user_card.dart';

class Favorites2Page extends StatefulWidget {
  const Favorites2Page({super.key});

  @override
  State<Favorites2Page> createState() => _Favorites2PageState();
}

class _Favorites2PageState extends State<Favorites2Page> {
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
