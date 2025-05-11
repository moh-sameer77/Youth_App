import 'package:flutter_application_1/src/feature/packages/view/packages_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var currentTitle = 'My Leads'.obs;
  RxBool showNotifications = false.obs;
  // final PageController pageController = PageController(initialPage: 0);
  RxList<int> navigationHistory = <int>[0].obs; 
  
  final List<Widget> pages = [
    const Center(key: ValueKey('home'), child: Text("Home Page")),
    const Center(key: ValueKey('search'), child: Text("Search Page")),
    const PackagesScreen(key: ValueKey('packages')),
    const Center(key: ValueKey('coverage'), child: Text("Coverage")),
    const Center(key: ValueKey('profile'), child: Text("Profile")),
  ];

  final List<String> titles = [
    "My Leads",
    "New Lead",
    "Packages",
    "Coverage",
    "Menu",
  ];

  void changeScreen(int index) {
    showNotifications.value = false;
    if (navigationHistory.last != index) {
      navigationHistory.add(index);
    }
    currentIndex.value = index;
    // pageController.jumpToPage(index);
    updateTitle(index);
  }

  void goBack() {
    if (navigationHistory.length > 1) {
      navigationHistory.removeLast();
      currentIndex.value = navigationHistory.last;
      // pageController.jumpToPage(navigationHistory.last);
      updateTitle(navigationHistory.last);
    }
  }

  void updateTitle(int index) {
    switch (index) {
      case 0:
        currentTitle.value = 'My Leads';
        break;
      case 1:
        currentTitle.value = 'New Lead';
        break;
      case 2:
        currentTitle.value = 'Packages';
        break;
      case 3:
        currentTitle.value = 'Coverage';
        break;
      case 4:
        currentTitle.value = 'Menu';
        break;
    }
  }

  void toggleNotifications() {
    showNotifications.value = !showNotifications.value;
    currentTitle.value = 'Notifications';
  }
}