import 'package:flutter/material.dart';

class OrderSummaryModel {
  final String providerName;
  final String providerInitials;
  final Color providerAvatarColor;
  final String providerRating;
  final String providerProfession;
  final String service;
  final String date;
  final String time;
  final String address;
  final String serviceDuration;
  final double serviceFee;
  final double platformFee;
  final String? promoCode;
  final double? discount;

  const OrderSummaryModel(
    this.serviceDuration, {
    required this.providerName,
    required this.providerInitials,
    required this.providerAvatarColor,
    required this.providerRating,
    required this.providerProfession,
    required this.service,
    required this.date,
    required this.time,
    required this.address,
    required this.serviceFee,
    required this.platformFee,
    this.promoCode,
    this.discount,
  });

  // calculated fields
  double get total => serviceFee + platformFee - (discount ?? 0);
}
