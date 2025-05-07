import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/bottomNavbar.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Bottomnavbar(),
    );
  }
}
