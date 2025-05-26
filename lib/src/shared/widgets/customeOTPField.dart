import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';

class OtpInputField extends StatefulWidget {
  final String labelText;
  final String sentToValue;

  const OtpInputField(
      {super.key, required this.labelText, required this.sentToValue});

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  final Color filledBorderColor = AppTheme.lightAppColors.primary; // Purple
  final Color emptyBorderColor = AppTheme.lightAppColors.bordercolor;  // Light gray
  final Color filledBackgroundColor = AppTheme.lightAppColors.containercolor;
  final Color emptyBackgroundColor = AppTheme.lightAppColors.background; // Very light gray

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          text: widget.labelText,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Text(
          localizations!.translate('sendTo') + widget.sentToValue,
          style:  TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppTheme.lightAppColors.mainTextcolor),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            final isFilled = _controllers[index].text.isNotEmpty;
            return SizedBox(
              width: 45,
              height: 50,
              child: TextField(
                controller: _controllers[index],
                textAlign: TextAlign.center,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: const TextStyle(fontSize: 20),
                decoration: _buildInputDecoration(isFilled),
              ),
            );
          }),
        ),
      ],
    );
  }


  InputDecoration _buildInputDecoration(bool isFilled) {
    return InputDecoration(
      counterText: "",
      filled: true,
      fillColor: isFilled ? filledBackgroundColor : emptyBackgroundColor,
      contentPadding: const EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isFilled ? filledBorderColor : emptyBorderColor,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: filledBorderColor,
          width: 2,
        ),
      ),
    );
  }
}
