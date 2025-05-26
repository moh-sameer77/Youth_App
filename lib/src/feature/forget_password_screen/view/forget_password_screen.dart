import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/forget_password_screen/view/ResetPasswordScreen.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';



class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  String? _emailError;



  void validateForm() {
    final localizations = AppLocalizations.of(context);

    setState(() {
      _emailError = null;


      if (_emailController.text.trim().isEmpty) {
        _emailError = localizations!.translate('email_cannot_be_empty');
      } else if (!EmailValidator.validate(_emailController.text)) {
        _emailError = localizations!.translate('enter_avalid_email_or_mobilenumber');
      }


    });

    if (_emailError == null ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
      );
    }
  }



  Widget buildEmail() {
    final localizations = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          localizations!.translate("yourRegisteredEmail"),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppTheme.lightAppColors.mainTextcolor,
          ),
        ),
        SizedBox(height: 8),

        // Input Field
        Container(
          decoration: BoxDecoration(
            color: AppTheme.lightAppColors.containercolor, // White background
            border: Border.all(
              color: AppTheme.lightAppColors.bordercolor, // Light gray border
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),

          ),
          child: TextFormField(

            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: localizations.translate('email'),
              hintStyle: TextStyle(
                color: AppTheme.lightAppColors.subTextcolor,
                fontSize: 15
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              border: InputBorder.none,
            ),
          ),
        ),
        if (_emailError != null)
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Text(
              _emailError!,
              style: TextStyle(color: AppTheme.lightAppColors.cancelcolor, fontSize: 14),
            ),
          ),
      ],
    );

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
                    localizations!.translate('forgot_password'),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: Center(
                                child: Text(
                                    localizations.translate('please_enter_your_registered_email_below'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:AppTheme.lightAppColors.mainTextcolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,


                                    )
                                )
                            ),
                          ),
                          SizedBox(height: 30),

                          //UserName
                          CustomInputField(
                            labelText: AppLocalizations.of(context)!.translate('yourRegisteredEmail'),
                            hintText:localizations.translate('email') ,
                            hintStyle: TextStyle(
                              color: AppTheme.lightAppColors.subTextcolor,
                              fontSize: 15,
                            ),
                            controller: _emailController,
                            errorText: _emailError,
                            onChanged: (value) {
                              setState(() {
                                _emailError = null;
                              });
                            },
                          ),

                          SizedBox(height: 30),

                          // Send Button

                          CustomButton(
                            text: AppLocalizations.of(context)!.translate('send'),

                            buttonColor: AppTheme.lightAppColors.secondaryColor,
                            onPressed: () {
                              validateForm();
                            },
                          ),
                          // Sign Up Text

                          SizedBox(height: 10),

                        ],
                      ),
                    ),
                  ),),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}