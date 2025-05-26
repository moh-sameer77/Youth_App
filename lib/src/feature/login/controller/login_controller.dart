import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/feature/my_leads/view/my_leads_screen.dart';
import 'package:flutter_application_1/src/shared/widgets/bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';


class LoginController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameError = ''.obs;
  final passwordError = ''.obs; 
  final formKey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;

  final LocalAuthentication auth = LocalAuthentication();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool isValidPhoneNumber(String input) {
    final RegExp phoneRegex = RegExp(r'^(?:\+?\d{1,3})?\d{8,15}$');
    return phoneRegex.hasMatch(input);
  }

  String? validateUsername(String? value, BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final input = value?.trim() ?? '';

    if (input.isEmpty) {
      userNameError.value = localizations!.translate('userName_cannot_be_empty');
      return  userNameError.value;
    }

    if (!EmailValidator.validate(input) && !isValidPhoneNumber(input)) {
      userNameError.value = localizations!.translate('enter_avalid_email_or_mobilenumber');
      return userNameError.value;
    }

    return null;
  }

  String? validatePassword(String? value, BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if ((value ?? '').isEmpty) {
      return localizations!.translate('password_cannot_be_empty');
    }
    return null;
  }

  void submit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Get.offAll(() => Bottomnavbar());
    }
  }

  Future<void> authenticateWithBiometrics(BuildContext context) async {
    final localizations = AppLocalizations.of(context);
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      bool isDeviceSupported = await auth.isDeviceSupported();
      List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

      if (!canCheckBiometrics || !isDeviceSupported || availableBiometrics.isEmpty) {
        _showBiometricSettingsDialog(context);
        return;
      }

      String biometricType = availableBiometrics.contains(BiometricType.face)
          ? localizations!.translate('face_recognition')
          : localizations!.translate('fingerprint');

      bool isAuthenticated = await auth.authenticate(
        localizedReason: localizations.translate('sign_in_biometric') ??
            "Authenticate using $biometricType",
        options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
      );

      if (isAuthenticated) {
        Get.snackbar("Success", localizations.translate('login_success'));
        Get.offAll(() => MyLeadsScreen());
      } else {
        Get.snackbar("Error", localizations.translate('login_failed'));
      }
    } catch (e) {
      debugPrint("Biometric Auth Error: $e");
      Get.snackbar("Error", localizations!.translate('login_failed'));
    }
  }

  void _showBiometricSettingsDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(localizations!.translate('biometric_not_available')),
        content: Text(localizations.translate('enable_biometrics_in_settings')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.translate('cancel')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.translate('settings')),
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
