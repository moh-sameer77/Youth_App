import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/login/view/login_screen.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MenuModal extends StatefulWidget {
  const MenuModal({Key? key}) : super(key: key);

  @override
  State<MenuModal> createState() => _MenuModalState();
}

class _MenuModalState extends State<MenuModal> {
  String _selectedLanguage = 'English';
  bool _biometricsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // My Profile
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.lightAppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: AppTheme.lightAppColors.mainTextcolor,
              title:  Text(AppLocalizations.of(context)!
                  .translate('profile')),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileScreen()),
                // );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Language Toggle
        /*  Container(
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.BackgroundLightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Text("Language"),
                const Spacer(),
                _buildLanguageToggle(),
              ],
            ),
          ),
          const SizedBox(height: 12),*/

          // Enable Biometrics
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color:  AppTheme.lightAppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: buildBiometricSwitchTile()
          ),
          const SizedBox(height: 12),

          // Logout
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color:  AppTheme.lightAppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor:    AppTheme.lightAppColors.background,
              title: Text("Logout", style: TextStyle(color: AppTheme.lightAppColors.secondaryColor)),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.lightAppColors.secondaryColor),
              onTap: () {
                // Handle logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildLanguageToggle() {
    return Container(
      height: 36,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
         color: AppTheme.lightAppColors.background,
      ),
      child: Row(
        children: [
          _buildLanguageChip("English"),
          const SizedBox(width: 4),
          _buildLanguageChip("العربية"),
        ],
      ),
    );
  }

  Widget _buildLanguageChip(String language) {
    final isSelected = _selectedLanguage == language;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.lightAppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          language,
          style: TextStyle(
            color: isSelected ? AppTheme.lightAppColors.containercolor : AppTheme.lightAppColors.mainTextcolor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


  Widget buildBiometricSwitchTile() {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppTheme.lightAppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Text(
            'Enable Biometrics',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppTheme.lightAppColors.mainTextcolor),
          ),
          FlutterSwitch(
            width: 60.0,         // Increased width
            height: 32.0,        // Slightly taller
            toggleSize: 24.0,
            value: _biometricsEnabled,
            activeColor: AppTheme.lightAppColors.primary,
            inactiveColor: AppTheme.lightAppColors.bordercolor,
            toggleColor:  AppTheme.lightAppColors.containercolor,
            borderRadius: 20.0,
            padding: 4.0,
            showOnOff: false,
            onToggle: (val) {
              // This set
              //State must be called in a StatefulWidget
              setState(() {
                _biometricsEnabled=val;
              });
            },
          ),
        ],
      ),
    );
  }
}
