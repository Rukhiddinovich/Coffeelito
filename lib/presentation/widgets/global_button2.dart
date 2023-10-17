// ignore_for_file: deprecated_member_use

import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color buttonColor;
  final Color textColor;
  final Color? iconColor;

  const GlobalButton({
    required this.buttonText,
    required this.iconData,
    required this.onPressed,
    this.width = 150,
    this.height = 45,
    this.borderRadius = 45,
    Key? key,
    required this.buttonColor,
    required this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: Size(width, height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
                fontSize: 16.sp,
                color: textColor,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
          ),
          10.pw,
          Icon(
            iconData,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
