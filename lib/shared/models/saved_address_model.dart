import 'package:flutter/material.dart';

class SavedAddressModel {
  final String title;
  final IconData icon;
  final String address;
  final VoidCallback? onTap;

  SavedAddressModel({
    required this.title,
    required this.icon,
    required this.address,
    this.onTap,
  });
}
