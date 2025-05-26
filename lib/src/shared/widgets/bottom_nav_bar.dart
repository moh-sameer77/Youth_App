import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/navigation_controller.dart';
import 'package:flutter_application_1/src/feature/notifications/view/notifications_screen.dart';
import 'package:flutter_application_1/src/feature/menu/view/menu_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_app_bar.dart';

class Bottomnavbar extends StatefulWidget {
  final int initialIndex;
  const Bottomnavbar({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  late final NavigationController navController;

  @override
  void initState() {
    super.initState();
    navController = Get.put(NavigationController());
    navController.setInitialIndex(widget.initialIndex);
  }

  void _showMenuModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const MenuModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navController.showNotifications.value) {
          navController.toggleNotifications();
          return false;
        } else if (navController.currentIndex.value == 0) {
          return true;
        } else if (navController.navigationHistory.length > 1) {
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
                : navController.titles[selectedIndex],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: navController.showNotifications.value
                ? const NotificationsScreen(key: ValueKey('notifications'))
                : navController.pages[selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              if (index == 4) {
                _showMenuModal(context); // Show the menu modal
              } else {
                navController.changeScreen(index);
              }
            },
            selectedItemColor: AppTheme.lightAppColors.primary,
            unselectedItemColor: AppTheme.lightAppColors.mainTextcolor,
            backgroundColor: AppTheme.lightAppColors.containercolor,
            unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            selectedLabelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            items: [
              const BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, size: 28),
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(Icons.add_circle, size: 28),
                icon: Icon(Icons.add_circle_outline),
                label: "New Lead",
              ),
              BottomNavigationBarItem(
                icon: Icon(selectedIndex == 2 ? Icons.list_alt : Icons.list_alt_outlined),
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
