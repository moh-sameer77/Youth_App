import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/login/view/login_screen.dart';
import 'package:flutter_application_1/src/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalStorageController extends GetxController {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  var token = RxString('');

  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(key: 'jwt_token', value: token);
      this.token.value = token;
      loadToken();
    } catch (e) {
      print("Error saving token: $e");
    }
  }

  Future<String?> getToken() async {
    try {
      return await _secureStorage.read(key: 'jwt_token');
    } catch (e) {
      print("Error retrieving token: $e");
      return null;
    }
  }

  Future<void> loadToken() async {
    try {
      // Get.offAll(Bottomnavbar()); 
      Get.offAll(
         LoginScreen(),
        transition: Transition.fade,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
      // String? token = await _secureStorage.read(key: 'jwt_token');
      // if (token != null) {
      //   this.token.value = token;
      //   // Get.offAllNamed(newRouteName);

      // } else {
      //   print('No token found, navigate to login');
      //   // Get.offAll(() => const RegisterPage());
      // }
    } catch (e) {
      print("Error loading token: $e");
    }
  }

  Future<void> removeToken() async {
    try {
      await _secureStorage.delete(key: 'jwt_token');
      loadToken();
    } catch (e) {
      print("Error removing token: $e");
    }
  }
}
