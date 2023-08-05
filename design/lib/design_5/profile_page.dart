import 'dart:async';

import 'package:design/design_5/models.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentProfile = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _updateProfile();
    });
  }

  void _updateProfile() {
    setState(() {
      if (_currentProfile < models.length - 1) {
        _currentProfile++;
      } else {
        _currentProfile = 0;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = models[_currentProfile];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _background(model, size),
          _back(),
          _menu(),
          _title(model),
          _profile(model),
          _line(size),
          _recommendedField(model),
        ],
      ),
    );
  }

  Widget _background(Model model, Size size) {
    return Container(
      color: model.backgroundColor,
      height: size.height * 0.65,
    );
  }

  Widget _back() {
    return const Align(
      alignment: Alignment(-0.9, -0.85),
      child: Icon(
        Icons.navigate_before,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  Widget _menu() {
    return const Align(
      alignment: Alignment(0.9, -0.85),
      child: Icon(
        Icons.more_horiz,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  Widget _title(Model model) {
    return Align(
      alignment: const Alignment(0, 0.35),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          model.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _profile(Model model) {
    return Align(
      alignment: const Alignment(0, 0.6),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _profileInfo(model),
            _followButton(),
          ],
        ),
      ),
    );
  }

  Widget _profileInfo(Model model) {
    return Row(
      children: [
        const SizedBox(width: 25),
        CircleAvatar(
          maxRadius: 30,
          backgroundColor: model.profileColor,
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.nickName,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              model.statusOnline,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _followButton() {
    return Row(
      children: [
        InkWell(
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
              bottom: 5,
            ),
            height: 35,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(67, 37, 12, 0.9),
                  spreadRadius: 7,
                  blurRadius: 15,
                  offset: Offset(0, 0),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(248, 106, 34, 1),
                  Color.fromRGBO(250, 99, 92, 1),
                ],
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                Text(
                  "Follow",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _line(Size size) {
    return Align(
      alignment: const Alignment(0, 0.73),
      child: SizedBox(
        width: size.width * 0.9,
        child: const Divider(
          color: Colors.grey,
          thickness: 0.2,
        ),
      ),
    );
  }

  Widget _recommendedField(Model model) {
    final profiles = model.recommendedColors;
    final recommended = model.recommendedUsers;
    final total = profiles.length;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _buildRecommended(profiles, recommended, total),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildRecommendedStats(model),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRecommendedStats(Model model) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          "${model.recommendedUsers} / ${model.totalUsers} users",
          style: const TextStyle(color: Colors.grey),
        ),
      ),
      const SizedBox(height: 25),
      Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            Icons.visibility,
            color: Colors.grey.withOpacity(0.6),
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            model.watched.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 15),
          Icon(
            Icons.mode_comment_rounded,
            color: Colors.grey.withOpacity(0.6),
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            model.commented.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 15),
          Icon(
            Icons.favorite,
            color: Colors.grey.withOpacity(0.6),
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            model.liked.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 10),
        ],
      ),
    ];
  }

  List<Widget> _buildRecommended(
      List<RecommendedColor> profiles, int recommended, int total) {
    return [
      const Text(
        "Recommended by :",
        style: TextStyle(color: Colors.grey),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 30,
        width: 120,
        child: Stack(
          children: [
            if (profiles.isNotEmpty)
              Align(
                alignment: const Alignment(-1, 0),
                child: CircleAvatar(
                  backgroundColor: profiles[0].profileColor,
                ),
              ),
            if (profiles.length > 1)
              Align(
                alignment: const Alignment(-0.65, 0),
                child: CircleAvatar(
                  backgroundColor: profiles[1].profileColor,
                ),
              ),
            if (profiles.length > 2)
              Align(
                alignment: const Alignment(-0.3, 0),
                child: CircleAvatar(
                  backgroundColor: profiles[2].profileColor,
                ),
              ),
            if (profiles.length > 3)
              Align(
                alignment: const Alignment(0.05, 0),
                child: CircleAvatar(
                  backgroundColor: profiles[3].profileColor,
                ),
              ),
            if (recommended > 4)
              Align(
                alignment: const Alignment(0.4, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: Text(
                    "+${recommended - total}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ];
  }
}
