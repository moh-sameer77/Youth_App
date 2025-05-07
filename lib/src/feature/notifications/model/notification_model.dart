import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;

  NotificationModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
  });
}
