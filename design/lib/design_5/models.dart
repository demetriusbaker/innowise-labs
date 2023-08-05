

import 'package:flutter/material.dart';

class Model {
  final String title;
  final String nickName;
  final String statusOnline;
  final Color profileColor;
  final Color backgroundColor;
  final List<RecommendedColor> recommendedColors;
  final int recommendedUsers;
  final int totalUsers;
  final int watched;
  final int commented;
  final int liked;

  const Model({
    required this.title,
    required this.nickName,
    required this.statusOnline,
    required this.profileColor,
    required this.backgroundColor,
    required this.recommendedColors,
    required this.recommendedUsers,
    required this.totalUsers,
    required this.watched,
    required this.commented,
    required this.liked,
  });
}

class RecommendedColor {
  final Color? profileColor;

  const RecommendedColor([this.profileColor]);
}
