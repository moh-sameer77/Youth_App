import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;


  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.buttonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:  TextStyle(fontSize: 16, color: AppTheme.lightAppColors.containercolor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
