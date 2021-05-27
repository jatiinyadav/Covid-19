import 'package:covid19_app_flutter/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
            child: Text(text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                )),
            color: color,
            height: 50.0,
            onPressed: onPressed,
            borderRadius: 4.0);
}
