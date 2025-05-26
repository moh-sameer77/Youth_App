import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/otp_screen/view/otpScreen.dart';
import 'package:flutter_application_1/src/shared/widgets/UploadImageFeild.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';
import 'package:flutter_application_1/src/shared/widgets/successDialog.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isJordanian = true;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _msisdnController = TextEditingController();
  final TextEditingController _universityNameController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();
  final TextEditingController _documnetNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String? _emailError ;
  String? _fullNameError ;
  String? _msisdnError ;
  String? _universityNameError ;
  String? _nationalIDError ;
  String? _documnetNumberError ;
  String? _passwordError ;
  String? _confirmPaswordError ;


  Widget _buildNationalitySelector() {
    final localizations = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          text: localizations!.translate('nationality'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isJordanian = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isJordanian ? AppTheme.lightAppColors.primary : AppTheme.lightAppColors.containercolor,
                    minimumSize: const Size.fromHeight(50),
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      side: BorderSide(color: AppTheme.lightAppColors.primary),
                    ),
                  ),
                  child: Text(
                    localizations!.translate('jordainian'),
                    style: TextStyle(
                      color: isJordanian ? AppTheme.lightAppColors.containercolor : AppTheme.lightAppColors.primary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isJordanian = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isJordanian ? AppTheme.lightAppColors.containercolor : AppTheme.lightAppColors.primary,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      side: BorderSide(color: AppTheme.lightAppColors.primary),
                    ),
                  ),
                  child: Text(
                    localizations!.translate('nonJordainian'),
                    style: TextStyle(
                      color:
                          isJordanian ?AppTheme.lightAppColors.primary :AppTheme.lightAppColors.containercolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow AppBar to overlay background
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
          // Background
          SizedBox(
            height: height * 2 / 3,
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.png", // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),


          Padding(
              padding: const EdgeInsets.only(left: 20,right:20, top: 40),
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Text(
                    localizations!.translate('createAccount'),
                    style: TextStyle(
                      color: AppTheme.lightAppColors.containercolor,
                      fontSize: 27,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 Expanded(child:  SingleChildScrollView(
                   child: Container(
                     padding: const EdgeInsets.all(20),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(16),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black12,
                           blurRadius: 10,
                           offset: Offset(0, 4),
                         ),
                       ],
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         //Registered Email
                         CustomInputField(
                           labelText: AppLocalizations.of(context)!
                               .translate('yourRegisteredEmail'),
                           controller: _emailController,
                           errorText: _emailError,
                           onChanged: (value) {
                             setState(() {
                               _emailError = null;
                             });
                           },
                         ),

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

                         //University Name
                         CustomInputField(
                           labelText: AppLocalizations.of(context)!
                               .translate('universityName'),
                           controller: _universityNameController,
                           errorText: _universityNameError,
                           onChanged: (value) {
                             setState(() {
                               _universityNameError = null;
                             });
                           },
                         ),

                         //University Id Image
                         CustomeImagesUploadField(
                           labelText: AppLocalizations.of(context)!
                               .translate('universityIdImage'),
                           hintText: AppLocalizations.of(context)!
                               .translate('frontIDSideImage'),
                           onImagePicked:
                               (File image, String filename, String base64) {
                             print("📂 Picked file: $filename");
                             print("🧬 Base64 string: $base64");

                             // You can now store the base64 string in your state
                           },
                         ),

                         //Select Nationality
                         _buildNationalitySelector(),

                         //National ID
                         CustomInputField(
                           labelText: AppLocalizations.of(context)!
                               .translate('nationalId'),
                           controller: _nationalIDController,
                           errorText: _nationalIDError,
                           onChanged: (value) {
                             setState(() {
                               _nationalIDError = null;
                             });
                           },
                         ),

                         //Front Id Image
                         CustomeImagesUploadField(
                           labelText: AppLocalizations.of(context)!
                               .translate('uploadOrScanID'),
                           hintText: AppLocalizations.of(context)!
                               .translate('frontIDSideImage'),
                           onImagePicked:
                               (File image, String filename, String base64) {
                             print("📂 Picked file: $filename");
                             print("🧬 Base64 string: $base64");

                             // You can now store the base64 string in your state
                           },
                         ),


                         //Back Id Image
                         CustomeImagesUploadField(
                           labelText: AppLocalizations.of(context)!
                               .translate('uploadOrScanID'),

                           hintText: AppLocalizations.of(context)!
                               .translate('backIDSideImage'),
                           showLabel:false,
                           onImagePicked:
                               (File image, String filename, String base64) {
                             print("📂 Picked file: $filename");
                             print("🧬 Base64 string: $base64");

                             // You can now store the base64 string in your state
                           },
                         ),

                         //Documnet Number
                         CustomInputField(
                           labelText: AppLocalizations.of(context)!
                               .translate('doucumentNumber'),
                           controller: _documnetNumberController,
                           errorText: _documnetNumberError,
                           onChanged: (value) {
                             setState(() {
                               _documnetNumberError = null;
                             });
                           },
                         ),

                         //Passport Image

                         CustomeImagesUploadField(
                           labelText: AppLocalizations.of(context)!
                               .translate('uploadOrScanPassport'),

                           hintText: AppLocalizations.of(context)!
                               .translate('passportMainPage'),
                           onImagePicked:
                               (File image, String filename, String base64) {
                             print("📂 Picked file: $filename");
                             print("🧬 Base64 string: $base64");

                             // You can now store the base64 string in your state
                           },
                         ),

                         //Password
                         CustomInputField(
                           labelText: AppLocalizations.of(context)!
                               .translate('password'),
                           controller: _passwordController,
                           errorText: _passwordError,
                           isPassword: true,
                           onChanged: (value) {
                             setState(() {
                               _passwordError = null;
                             });
                           },
                         ),

                         //ConfirmPassword
                         CustomInputField(
                           labelText: AppLocalizations.of(context)!
                               .translate('confirmPassword'),
                           controller: _confirmPasswordController,
                           errorText: _confirmPaswordError,
                           isPassword: true,
                           onChanged: (value) {
                             setState(() {
                               _confirmPaswordError = null;
                             });
                           },
                         ),

                         const SizedBox(height: 20),
                         CustomButton(
                           text:
                           AppLocalizations.of(context)!.translate('signUp'),
                           buttonColor: AppTheme.lightAppColors.secondaryColor,
                           onPressed: () {
                             showSuccessDialog(
                               context: context,
                               ShowThank: true,
                               messageText: localizations!.translate(
                                   'yourAccountHasBeenCreatedSuccessfully'),
                               ShowMessage: true,
                               message2Text: localizations!.translate(
                                   'you’llBeRedirectedToTheAppShortly'),
                               ShowMessage2: true,
                               buttonText1: "",
                               ShowButton1: false,
                               buttonText2: "",
                               ShowButton2: false,
                               onButton1Pressed: () {},
                               onButton2Pressed: () {
                                 // Navigator.of(context).pop(); // This will close the dialog
                               },
                             );
                             Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => OTPScreen()),
                             );
                             // },
                           } ),

                         const SizedBox(height: 20),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:  [
                             Text(AppLocalizations.of(context)!.translate('alreadyHaveAccount'),
                               style: TextStyle(
                                   color: AppTheme.lightAppColors.subTextcolor ,
                                   fontWeight: FontWeight.w400,
                                   fontSize: 16
                               ),
                             ),
                             Text(
                               AppLocalizations.of(context)!.translate('signIn'),
                               style: TextStyle(
                                   color: AppTheme.lightAppColors.primary,
                                   fontWeight: FontWeight.w700,
                                   fontSize: 16
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),),

                ],
              ),
            ),

        ],
      ),
    );
  }
}
