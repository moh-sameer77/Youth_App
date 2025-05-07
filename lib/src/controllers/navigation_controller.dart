import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var currentTitle = 'My Leads'.obs;
  RxBool showNotifications = false.obs;
  // final pageController = PageController();

  void changeScreen(int index) {
    showNotifications.value = false;
    currentIndex.value = index;
    // pageController.jumpToPage(index);
  }

  void updateTitle(int index){
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
