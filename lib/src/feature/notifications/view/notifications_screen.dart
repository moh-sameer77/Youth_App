import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/notifications/view/notification_tile.dart';
import 'package:flutter_application_1/src/feature/notifications/model/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationModel(
        title: "Package has been activated",
        description: "Congratulations! Package has been activated for Ahmed Khalid with mobile No. 0798765432",
        icon: Icons.check_circle,
        iconColor: AppTheme.lightAppColors.activatedColor,
      ),
      NotificationModel(
        title: "New Sales Lead Created",
        description: "New lead has been created for Ahmed Khalid with mobile No. 0798765432",
        icon: Icons.add_circle,
        iconColor: AppTheme.lightAppColors.createdColor,
      ),
      NotificationModel(
        title: "Lead has been Voided",
        description: "Lead for Ahmed Khalid with mobile No. 0798765432 has been voided",
        icon: Icons.cancel,
        iconColor: AppTheme.lightAppColors.cancelcolor,
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.zero, // Remove padding around the list
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationTile(
          title: notification.title,
          description: notification.description,
          icon: notification.icon,
          iconColor: notification.iconColor,
        );
      },
    );
  }
}
