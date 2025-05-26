import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/login/view/login_screen.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';
import 'package:flutter_application_1/src/shared/widgets/successDialog.dart';




class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _passwordError;
  String? _confirmPasswordError;




  void validateForm() {
    final localizations = AppLocalizations.of(context);

    setState(() {
      _passwordError = null;
      _confirmPasswordError = null;

      String password = _passwordController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();

      if (password.isEmpty) {
        _passwordError = localizations!.translate('password_cannot_be_empty');
      }
      if (confirmPassword.isEmpty) {
        _confirmPasswordError = localizations!.translate('password_cannot_be_empty');
      }
      if (password.isNotEmpty && confirmPassword.isNotEmpty && password != confirmPassword) {
        _confirmPasswordError = localizations!.translate('passwords_do_not_match');
      }
    });

    if (_passwordError == null && _confirmPasswordError == null) {
     // showSuccessDialog(context);
      showSuccessDialog(
        context: context,
        ShowThank: false,
        messageText:  localizations!.translate('your_password_has_been_changed_successfully'),
        ShowMessage: true,
        message2Text: "",
        ShowMessage2: false,
        buttonText1:  localizations!.translate('back_to_login'),
        ShowButton1:true,
        buttonText2: "",
        ShowButton2:false,
        onButton1Pressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );// This will close the dialog
        },
        onButton2Pressed: () {
          // Navigator.of(context).pop(); // This will close the dialog
        },
      );



    }
  }


  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the AppBar

      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: AppTheme.lightAppColors.containercolor),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),// Ensures the default back arrow appears
      ),
      resizeToAvoidBottomInset: false, // Prevents UI from resizing when keyboard appears

      backgroundColor: AppTheme.lightAppColors.background,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Background Image (Takes 60% of screen height)
            SizedBox(
              height: height * 2 / 3,
              width: double.infinity,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),

            // Logo Image
            Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/White logo.png", // Replace with your centered image
                  width: 200,
                  height: 60,// Adjust width as needed
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20,right:20, top: 150),
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Text(
                    localizations!.translate('resetPassword'),
                    style: TextStyle(
                      color: AppTheme.lightAppColors.containercolor,
                      fontSize: 27,

                        fontWeight: FontWeight.w700
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child:  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.lightAppColors.containercolor,
                        borderRadius: BorderRadius.circular(16),

                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Center(
                                child: Text(
                                    localizations.translate('resetMessage'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppTheme.lightAppColors.mainTextcolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,


                                    )
                                )
                            ),
                          ),
                          SizedBox(height: 30),

                          CustomInputField(
                            labelText: AppLocalizations.of(context)!.translate('password'),
                            hintText:localizations.translate('') ,
                            hintStyle: TextStyle(
                              color: AppTheme.lightAppColors.subTextcolor,
                              fontSize: 15,
                            ),
                            isPassword: true,
                            controller: _passwordController,
                            errorText: _passwordError,
                            onChanged: (value) {
                              setState(() {
                                _passwordError = null;
                              });
                            },
                          ),


                          SizedBox(height: 10),
                          CustomInputField(
                            labelText: AppLocalizations.of(context)!.translate('repeatPassword'),
                            hintText:localizations.translate('') ,
                            hintStyle: TextStyle(
                              color: AppTheme.lightAppColors.subTextcolor,
                              fontSize: 15,
                            ),
                            isPassword: true,
                            controller: _confirmPasswordController,
                            errorText: _confirmPasswordError,
                            onChanged: (value) {
                              setState(() {
                                _confirmPasswordError = null;
                              });
                            },
                          ),

                          SizedBox(height: 30),
                          // Send Button

                          CustomButton(
                            buttonColor: AppTheme.lightAppColors.secondaryColor,
                            text: AppLocalizations.of(context)!.translate('save'),
                            onPressed: () {
                              validateForm();
                            },
                          ),

                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),),

                ],
              ),
            ),
            // Centered Container

          ],
        ),
      ),
    );
  }
}