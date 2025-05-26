import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? errorText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator; 
  final bool isPassword;
  final String? hintText;
  final TextStyle? hintStyle;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.errorText,
    this.onChanged,
    this.isPassword = false,
    this.hintText,
    this.hintStyle, 
    this.validator,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: widget.labelText),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && !_isPasswordVisible,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.lightAppColors.bordercolor),
              borderRadius: BorderRadius.circular(10.0),

            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.lightAppColors.bordercolor),
              borderRadius: BorderRadius.circular(10.0),

            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.lightAppColors.primary),
              borderRadius: BorderRadius.circular(10.0), 
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.lightAppColors.cancelcolor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.lightAppColors.cancelcolor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            border: InputBorder.none,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
        ),
        // if (widget.errorText != null)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 5, left: 5),
        //     child: Text(
        //       widget.errorText!,
        //       style:  TextStyle(color: AppTheme.lightAppColors.cancelcolor , fontSize: 14),
        //     ),
        //   ),
      ],
    );
  }
}


class CustomDropdownField extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final String? selectedValue;
  final String? errorText;
  final Function(String?) onChanged;

  const CustomDropdownField({
    Key? key,
    required this.labelText,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: widget.labelText),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.lightAppColors.containercolor,
            border: Border.all(
              color: AppTheme.lightAppColors.textFieldBorderColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<String>(
            value: widget.selectedValue,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down_outlined, color: AppTheme.lightAppColors.subTextcolor), 
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            items: widget.options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            },
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Text(
              widget.errorText!,
              style:  TextStyle(color: AppTheme.lightAppColors.cancelcolor, fontSize: 14),
            ),
          ),
        const SizedBox(height: 8),
      ],
    );

  }
}






class Label extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;

  const Label({
    Key? key,
    required this.text,
    this.textAlign,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
      child: Text(
        text,
        textAlign: textAlign,
        style: style ?? const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

