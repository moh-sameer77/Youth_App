import 'package:flutter/material.dart';

import 'app_extension.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xffF6F8FA),
    extensions: [
      lightAppColors,
    ],
  );

  static final lightAppColors = AppColorsExtension(
    primary: const Color(0xff4F276C),
    secondaryColor: const Color(0xffCF0072),
    background: const Color(0xffF6F8FA),
    bordercolor: const Color(0xffE1E6EC),
    mainTextcolor: const Color(0xff1E232C),
    subTextcolor: const Color(0xff737375),
    containercolor: const Color(0xffFFFFFF),
    cancelcolor: const Color(0xffD40D03),
    activatedColor: const Color(0xff00905C),
    createdColor: const Color(0xff6C2F8C),
  );
}
