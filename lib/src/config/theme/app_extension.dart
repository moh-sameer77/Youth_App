import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension(
      {required this.primary,
      required this.background,
      required this.secondaryColor,
      required this.bordercolor,
      required this.mainTextcolor,
      required this.containercolor,
      required this.subTextcolor, 
      required this.cancelcolor,
      required this.activatedColor,
      required this.createdColor,
      required this.lightPurpleColor,
      required this.lightGreenColor,
      required this.lightYellowColor,
      required this.lightRedColor,
      required this.darkYellowColor,
      required this.textFieldBorderColor,
      required this.pinkColor

      });

  final Color primary;
  final Color background;
  final Color secondaryColor;
  final Color bordercolor;
  final Color containercolor;
  final Color subTextcolor;
  final Color mainTextcolor;
  final Color cancelcolor;
  final Color activatedColor;
  final Color createdColor;
  final Color lightPurpleColor;
  final Color lightGreenColor;
  final Color lightYellowColor;
  final Color lightRedColor;
  final Color darkYellowColor;
  final Color textFieldBorderColor;
  final Color pinkColor;

  @override
  ThemeExtension<AppColorsExtension> copyWith(
      {Color? primary,
      Color? background,
      Color? buttoncolor,
      Color? containercolor,
      Color? bordercolor,
      Color? subTextcolor,
      Color? mainTextcolor,
      Color? secondaryColor,
      Color? cancelcolor,
      Color? activatedColor, 
      Color? createdColor,
      Color? lightPurpleColor,
      Color? lightGreenColor,
      Color? lightYellowColor,
      Color? lightRedColor,
      Color? darkYellowColor,
      Color? textFieldBorderColor,
      Color? pinkColor,
      }) {
    return AppColorsExtension(
        primary: primary ?? this.primary,
        background: background ?? this.background,
        containercolor: containercolor ?? this.containercolor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        bordercolor: bordercolor ?? this.bordercolor,
        subTextcolor: subTextcolor ?? this.subTextcolor,
        mainTextcolor: mainTextcolor ?? this.mainTextcolor, 
        cancelcolor:cancelcolor ?? this.cancelcolor,
        activatedColor: activatedColor ?? this.activatedColor,
        createdColor: createdColor ?? this.createdColor,
        lightPurpleColor: lightPurpleColor ?? this.lightPurpleColor,
        lightGreenColor: lightGreenColor ?? this.lightGreenColor,
        lightYellowColor: lightYellowColor ?? this.lightYellowColor,
        lightRedColor: lightRedColor ?? this.lightRedColor,
        darkYellowColor: darkYellowColor ?? this.darkYellowColor,
        textFieldBorderColor: textFieldBorderColor ?? this.textFieldBorderColor,
        pinkColor: pinkColor ?? this.pinkColor,
        );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      containercolor: Color.lerp(containercolor, other.containercolor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      bordercolor: Color.lerp(bordercolor, other.bordercolor, t)!,
      mainTextcolor: Color.lerp(mainTextcolor, other.mainTextcolor, t)!,
      subTextcolor: Color.lerp(subTextcolor, other.subTextcolor, t)!,
      cancelcolor: Color.lerp(cancelcolor, other.cancelcolor, t)!,
      activatedColor: Color.lerp(activatedColor, other.activatedColor, t)!,
      createdColor: Color.lerp(createdColor, other.createdColor, t)!,
      lightPurpleColor: Color.lerp(lightPurpleColor, other.lightPurpleColor, t)!,
      lightGreenColor: Color.lerp(lightGreenColor, other.lightGreenColor, t)!,
      lightYellowColor: Color.lerp(lightYellowColor, other.lightYellowColor, t)!,
      lightRedColor: Color.lerp(lightRedColor, other.lightRedColor, t)!,
      darkYellowColor: Color.lerp(darkYellowColor, other.darkYellowColor, t)!,
      textFieldBorderColor: Color.lerp(textFieldBorderColor, other.textFieldBorderColor, t)!,
      pinkColor: Color.lerp(pinkColor, other.pinkColor, t)!



    );
  }
}
