import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/forget_password_screen/view/forget_password_screen.dart';
import 'package:flutter_application_1/src/feature/login/controller/login_controller.dart';
import 'package:flutter_application_1/src/feature/registration/create_account_screen.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

@override
Widget build(BuildContext context) {
  final controller = Get.put(LoginController());
  final localizations = AppLocalizations.of(context);
  final height = MediaQuery.of(context).size.height;

  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Stack(
      children: [
        SizedBox(
          height: height * 2 / 3,
          width: double.infinity,
          child: Image.asset("assets/images/background.png", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/White logo.png", width: 200, height: 60),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 150),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(localizations!.translate('login'),
                  style:  TextStyle(color: AppTheme.lightAppColors.containercolor, fontSize: 27, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.lightAppColors.containercolor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => CustomInputField(
                            labelText: localizations.translate('userName'),
                            hintText: localizations.translate('emailMobileNo'),
                            controller: controller.userNameController,
                            hintStyle:  TextStyle(color: AppTheme.lightAppColors.subTextcolor, fontSize: 15),
                            validator: (value) => controller.validateUsername(value, context),
                            errorText: controller.userNameError.value,
                            onChanged: (value) {
                              if (value!.isNotEmpty) {
                                controller.userNameError.value = '';
                                }
                                  // controller.formKey.currentState?.validate();

                            },
                          ),
                          ),

    
                          CustomInputField(
                            labelText: localizations.translate('password'),
                            hintText: localizations.translate('password'),
                            controller: controller.passwordController,
                            isPassword: true,
                            hintStyle: TextStyle(color: AppTheme.lightAppColors.subTextcolor, fontSize: 15),
                            validator: (value) => controller.validatePassword(value, context),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (_) {}),
                                  Text(localizations.translate('remember_me'),
                                      style: TextStyle(color: AppTheme.lightAppColors.subTextcolor, fontSize: 13)),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => ForgetPasswordScreen()),
                                child: Text(localizations.translate('forgot_password'),
                                    style: TextStyle(color: AppTheme.lightAppColors.primary, fontSize: 13, fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            text: localizations.translate('signIn'),
                            buttonColor: AppTheme.lightAppColors.secondaryColor,
                            onPressed: () => controller.submit(context),
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: GestureDetector(
                              onTap: () => Get.to(() => CreateAccountScreen()),
                              child: RichText(
                                text: TextSpan(
                                  text: localizations.translate('dontHaveAnAccount'),
                                  style: TextStyle(color: AppTheme.lightAppColors.subTextcolor),
                                  children: [
                                    TextSpan(
                                      text: localizations.translate('signUp'),
                                      style: TextStyle(color: AppTheme.lightAppColors.primary, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
}


