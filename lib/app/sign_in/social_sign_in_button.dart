import 'package:covid19_app_flutter/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    required String assetsName,
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetsName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              Opacity(
                opacity: 0,
                child: Image.asset(assetsName),
              ),
            ],
          ),
          color: color,
          height: 45.0,
          onPressed: onPressed,
          borderRadius: 4.0,
        );
}
