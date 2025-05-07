import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/controllers/navigation_controller.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

 CustomAppBar({Key? key, required this.title}) : super(key: key);

    final NavigationController navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: preferredSize.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6E2E9D), Color(0xFF4F276C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: -30,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.04),
            ),
          ),
        ),
        Positioned(
          top: -35,
          left: 40,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
        ),
        Container(
          height: preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontFamily: 'Zain', 
                  color: AppTheme.lightAppColors.containercolor,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
              IconButton(
                icon:  navController.showNotifications.value ?
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 28,
                  )  : 
                  Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 28,
                  )  ,
                  onPressed: () { 
                    navController.toggleNotifications();
                  },
                    
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
