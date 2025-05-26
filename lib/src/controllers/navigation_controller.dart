import 'package:flutter_application_1/src/feature/menu/view/menu_widget.dart';
import 'package:flutter_application_1/src/feature/my_leads/view/my_leads_screen.dart';
import 'package:flutter_application_1/src/feature/new_leads/view/new_lead_screen.dart';
import 'package:flutter_application_1/src/feature/packages/view/packages_screen.dart';
import 'package:flutter_application_1/src/feature/profile/view/profileScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var currentTitle = 'My Leads'.obs;
  RxBool showNotifications = false.obs;
  RxBool showProfile = false.obs;
  RxList<int> navigationHistory = <int>[0].obs;

  final List<Widget> pages = [
    MyLeadsScreen(key: ValueKey('my_leads')),
    NewLeadScreen(key: ValueKey('new_lead')),
    const PackagesScreen(key: ValueKey('packages')),
    const Center(key: ValueKey('coverage'), child: Text("Coverage")),
    // MenuModal(key: ValueKey('coverage')),
    // Profilescreen(key: ValueKey('profile')),
  ];

  final List<String> titles = [
    "My Leads",
    "New Lead",
    "Packages",
    "Coverage",
    "Menu",
  ];

  final Map<int, String> routeMap = {
    0: '/home',
    1: '/newlead',
    2: '/packages',
    3: '/coverage',
    4: '/menu',
  };
  
  void setInitialIndex(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
      updateTitle(index);
      if (navigationHistory.last != index) {
        navigationHistory.add(index);
      }
    }
  }

  void changeScreen(int index) {
    showNotifications.value = false;
    if (navigationHistory.last != index) {
      navigationHistory.add(index);
    }
    currentIndex.value = index;
    updateTitle(index);
    updateRoute(index);
  }

  void goBack() {
    if (navigationHistory.length > 1) {
      navigationHistory.removeLast();
      currentIndex.value = navigationHistory.last;
      updateTitle(currentIndex.value);
      updateRoute(currentIndex.value);
    }
  }

  void updateTitle(int index) {
    if (index >= 0 && index < titles.length) {
      currentTitle.value = titles[index];
    }
  }

  void updateRoute(int index) {
    String? newRoute = routeMap[index];
    if (newRoute != null && Get.currentRoute != newRoute) {
          print("newRoute: "+ newRoute.toString());

      Get.offNamed(newRoute);
    }
  }

  void toggleNotifications() {
    showNotifications.value = !showNotifications.value;
    currentTitle.value = 'Notifications';
  }
}
