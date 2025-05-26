import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/constants.dart';
import 'package:flutter_application_1/src/feature/local_storage/local_storage_controller.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final localStorageController = Get.put(LocalStorageController());
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); 
    await localStorageController.loadToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppConstants.splashBackgroundImage,
            fit: BoxFit.cover,
          ),

          Center(
            child: Image.asset(
              AppConstants.logoImage, 
              width: 500, 
            ),
          ),
        ],
      ),
    );
  }
}