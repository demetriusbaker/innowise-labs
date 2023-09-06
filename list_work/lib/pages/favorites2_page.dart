import 'package:flutter/material.dart';
import 'package:list_work/data/store.dart';
import 'package:list_work/model/user.dart';
import 'package:list_work/widgets/user_card.dart';

class Favorites2Page extends StatefulWidget {
  const Favorites2Page({super.key});

  @override
  State<Favorites2Page> createState() => _Favorites2PageState();
}

class _Favorites2PageState extends State<Favorites2Page> {
  final List<User> _users = [];
  bool loading = false, removed = false;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6), () {
      _controller.addListener(() {
        if (_controller.position.pixels >=
                _controller.position.maxScrollExtent &&
            !loading) _swipeToRefresh(false);
      });
      _users.addAll(generateUsers(20));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _users.isEmpty
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _users.clear();
                  removed = true;
                });
              },
            ),
      body: RefreshIndicator(
        onRefresh: _swipeToRefresh,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Stack(
              children: [
                if (_users.isEmpty && removed)
                  const Center(
                    child: Text("Oops! There's no data!"),
                  ),
                if (_users.isEmpty && !removed)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: _users.length,
                  itemBuilder: (_, index) {
                    if (index >= _users.length - 1) {
                      return Column(
                        children: [
                          UserCard(user: _users[index]),
                          const SizedBox(height: 25),
                          const Text("Wait for 3 seconds to get more users..."),
                          const SizedBox(height: 25),
                        ],
                      );
                    }
                    return UserCard(user: _users[index]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _swipeToRefresh([bool remove = true]) async {
    if (remove) _users.clear();
    removed = false;
    _fetchUsers();
  }

  void _fetchUsers() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    List<User> newUsers = generateUsers();
    _users.addAll(newUsers);

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
