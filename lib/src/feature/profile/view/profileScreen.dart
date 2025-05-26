import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';
class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  int _selectedIndex = 4; // Set the selected index for "New Lead"
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _msisdnController = TextEditingController();
  final TextEditingController _zainCashNumberController = TextEditingController();


  String? _fullNameError ;
  String? _msisdnError ;
  String? _zainCashNumberError ;




  @override
  Widget build(BuildContext context) {


    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // This is key!

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FullName
              CustomInputField(
                labelText: AppLocalizations.of(context)!
                    .translate('fullName'),
                controller: _fullNameController,
                errorText: _fullNameError,
                onChanged: (value) {
                  setState(() {
                    _fullNameError = null;
                  });
                },
              ),

              //MSISDN NUMBER
              CustomInputField(
                labelText: AppLocalizations.of(context)!
                    .translate('msisdnNumber'),
                controller: _msisdnController,
                errorText: _msisdnError,
                onChanged: (value) {
                  setState(() {
                    _msisdnError = null;
                  });
                },
              ),

              //ZainCash Number
              CustomInputField(
                labelText: AppLocalizations.of(context)!
                    .translate('zainCashNumber'),
                controller: _zainCashNumberController,
                errorText: _zainCashNumberError,
                onChanged: (value) {
                  setState(() {
                    _zainCashNumberError = null;
                  });
                },
              ),




              const SizedBox(height: 20),
              CustomButton(
                  text:
                  AppLocalizations.of(context)!.translate('save'),
                  buttonColor: AppTheme.lightAppColors.secondaryColor,
                  onPressed: () {


                  } ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
  }
}
