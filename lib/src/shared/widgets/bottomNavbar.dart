import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/navigation_controller.dart';
import 'package:flutter_application_1/src/feature/notifications/view/notifications_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/CustomAppBar.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  final NavigationController navController = Get.put(NavigationController());


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navController.showNotifications.value) {
          navController.toggleNotifications();
          return false;   
        }
        else if(navController.currentIndex.value == 0) {
          return true; 
        }
        else if (navController.navigationHistory.length > 1) {
          navController.goBack();
          return false; 
        }

        return true;
      },
      child: Obx(() {
        int selectedIndex = navController.currentIndex.value;

        return Scaffold(
          appBar: CustomAppBar(
              title: navController.showNotifications.value
                  ? "Notifications"
                  : navController.titles[selectedIndex]),
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: navController.showNotifications.value
                ? NotificationsScreen(key: ValueKey('notifications'))
                : navController.pages[selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: navController.changeScreen,
            selectedItemColor: AppTheme.lightAppColors.primary,
            unselectedItemColor: AppTheme.lightAppColors.mainTextcolor,
            backgroundColor: AppTheme.lightAppColors.containercolor,
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            selectedLabelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            items:  [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, size: 28,) ,
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.add_circle, size: 28,),
              icon: Icon(
              Icons.add_circle_outline),
              label: "New Lead",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  selectedIndex == 2 ? Icons.list_alt : Icons.list_alt_outlined),
              label: "Packages",
            ),
            BottomNavigationBarItem(
              icon: Icon(selectedIndex == 3 ? Icons.map : Icons.map_outlined),
              label: "Coverage",
            ),
            BottomNavigationBarItem(
              icon: Icon(selectedIndex == 4 ? Icons.close : Icons.menu),
              label: "Menu",
            ),
            ],
          ),
        );
      }),
    );
  }
}