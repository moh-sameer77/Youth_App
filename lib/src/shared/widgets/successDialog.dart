import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';

void showSuccessDialog({

  required BuildContext context,

  required bool ShowThank,
  required String messageText,
  required bool ShowMessage,
  required String message2Text,
  required bool ShowMessage2,
  required String buttonText1,
  required bool ShowButton1,
  required String buttonText2,
  required bool ShowButton2,
  required VoidCallback onButton1Pressed,
  required VoidCallback onButton2Pressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing by tapping outside
    builder: (BuildContext context) {
      final localizations = AppLocalizations.of(context);

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success Image
              Image.asset("  assets/images/successImage.png", height: 120), // Replace with your success image

              const SizedBox(height: 20),

              ShowThank==true? Padding(
                padding: const EdgeInsets.only(top:20.0,bottom: 20),
                child: Text(
                  localizations!.translate('thankYou'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.lightAppColors.mainTextcolor,
                  ),
                ),
              ):SizedBox(),
              // Dynamic Success Message
              ShowMessage==true?Text(
                messageText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightAppColors.mainTextcolor ,
                ),
              ):SizedBox(),

              ShowMessage2==true?
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Text(
                  message2Text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.lightAppColors.mainTextcolor,
                  ),
                ),
              ):SizedBox(),
              const SizedBox(height: 25),

              // Button with Dynamic Text
             ShowButton1==true? CustomButton(
                text: buttonText1,
                buttonColor: AppTheme.lightAppColors.secondaryColor,
                onPressed: onButton1Pressed
              ):Container(),
              SizedBox(height: 20,),
              ShowButton2==true?  CustomButton(
                buttonColor: AppTheme.lightAppColors.primary,
                text: buttonText2,
                onPressed: onButton2Pressed
              ):Container(),

            ],
          ),
        ),
      );
    },
  );
}
