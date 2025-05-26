import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/customeOTPField.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:sms_autofill/sms_autofill.dart';


class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>  with CodeAutoFill{


  final TextEditingController emailOtpController = TextEditingController();
  final TextEditingController msisdnOtpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenForCode(); // Start listening for SMS OTP
  }



  @override
  void dispose() {
    cancel(); // Stop listening when done
    emailOtpController.dispose();
    msisdnOtpController.dispose();
    super.dispose();
  }


  @override
  void codeUpdated() {
    setState(() {
      emailOtpController.text = code ?? '';
      msisdnOtpController.text = code ?? '';// Auto-fill OTP when received
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents UI from resizing when keyboard appears

      extendBodyBehindAppBar: true, // Allow  to overlay background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset(
          "assets/images/White logo.png",
          height: 40,
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          // BackgroundAppBar
          SizedBox(
            height: height * 2 / 3,
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.png", // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              children: [
                SizedBox(height: 150,),
                Text(
                  localizations!.translate('otpVerification'),
                  style: TextStyle(
                    color: AppTheme.lightAppColors.containercolor,
                    fontSize: 27,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppTheme.lightAppColors.containercolor,
                          borderRadius: BorderRadius.circular(16),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations!.translate('otpMessage'),
                              style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.lightAppColors.mainTextcolor,
                                fontWeight: FontWeight.w700,

                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),


                            OtpInputField(labelText:  localizations!.translate('emailOtp'),sentToValue: "alyounissasfi@gmail.com"),

                            const SizedBox(height: 30),

                            OtpInputField(labelText:  localizations!.translate('msisdnOTP'),sentToValue: "0795726155"),

                            const SizedBox(height: 30),

                            // Check Button
                            CustomButton(
                              buttonColor: AppTheme.lightAppColors.secondaryColor,
                              text: AppLocalizations.of(context)!.translate('check'),
                              onPressed: () {
                               // validateForm();
                               Get.offAllNamed("/BottomNavBar");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),),

              ],
            ),
          ),

        ],
      ),
    );
  }


}
