import 'package:flutter/material.dart';
import 'package:list_work/data/store.dart';
import 'package:list_work/widgets/asymmetric_table.dart';
import 'package:random_name_generator/random_name_generator.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final users = generateUsers(20, Zone.ukraine);
    return AsymmetricTable(users: users);
  }
}
