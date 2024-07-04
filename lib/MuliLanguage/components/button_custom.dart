import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  // final Color? borderColor;
  final double? height;
  final double? borderRadius;
  final double? elevation;
  final IconData? icon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor = const Color.fromARGB(255, 253, 173, 162),
    // this.borderColor = Colors.white,
    this.borderRadius = 10.0,
    this.elevation = 2.0,
    this.icon,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
    this.height=50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: Colors.grey,
          // side: BorderSide(color: borderColor!, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          padding: padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, size: fontSize),
            if (icon != null)
              const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}