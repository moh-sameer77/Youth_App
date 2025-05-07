import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;

  const NotificationTile({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.lightAppColors.containercolor,
          height: 89,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.lightAppColors.mainTextcolor,
                  fontFamily: 'Zain',
                ),
              ),
              subtitle: Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.lightAppColors.subTextcolor,
                  fontFamily: 'Zain',
                ),
              ),
            ),
          ),
        ),
        Divider(
          height: 1,
          color: AppTheme.lightAppColors.bordercolor,
        ),
      ],
    );
  }
}
