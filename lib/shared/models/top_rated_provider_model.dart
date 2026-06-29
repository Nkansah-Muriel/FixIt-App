import 'package:flutter/material.dart';

class TopRatedProvider {
  final String initials;
  final Color avatarColor;
  final String name;
  final String profession;
  final double rating;
  final int reviews;

  const TopRatedProvider({
    required this.initials,
    required this.avatarColor,
    required this.name,
    required this.profession,
    required this.rating,
    required this.reviews,
  });
}
