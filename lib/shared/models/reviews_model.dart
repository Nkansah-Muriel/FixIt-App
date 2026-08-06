import 'package:flutter/widgets.dart';

class ReviewModel {
  final String name;
  final String initials;
  final Color avatarColor;
  final double rating;
  final String comment;
  final String date;

  const ReviewModel({
    required this.name,
    required this.initials,
    required this.avatarColor,
    required this.rating,
    required this.comment,
    required this.date,
  });
}
