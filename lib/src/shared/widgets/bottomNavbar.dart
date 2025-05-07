import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/navigation_controller.dart';
import 'package:flutter_application_1/src/feature/notifications/view/notifications_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/CustomAppBar.dart';
import 'package:flutter_application_1/src/feature/packages/view/packages_screen.dart';

class Bottomnavbar extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

final List<Widget> _pages = [
  Center(key: ValueKey('home'), child: Text("Home Page")),
  Center(key: ValueKey('search'), child: Text("Search Page")),
  PackagesScreen(key: ValueKey('packages')),
  Center(key: ValueKey('coverage'), child: Text("Coverage")),
  Center(key: ValueKey('profile'), child: Text("Profile")),
];

  final List<String> _titles = [
    "My Leads",
    "New Lead",
    "Packages",
    "Coverage",
    "Menu",
    "Notifications",
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = navController.currentIndex.value;

      return Scaffold(
        appBar: CustomAppBar(title: navController.showNotifications.value? "Notifications" : _titles[selectedIndex]),
        body: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: navController.showNotifications.value
                    ? NotificationsScreen(key: ValueKey('notifications'))
                    : _pages[selectedIndex],
              ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: navController.changeScreen,
          selectedItemColor: AppTheme.lightAppColors.primary,
          unselectedItemColor: AppTheme.lightAppColors.mainTextcolor,
          backgroundColor: AppTheme.lightAppColors.containercolor,
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  selectedIndex == 1 ? Icons.add_circle : Icons.add_circle_outline),
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
    });
  }
}
