import 'package:flutter/material.dart';
import 'appColors.dart';

class FlatCircularButton extends StatelessWidget {
  // final String buttonString;
  final Function()? onPressed;
  final Icon icon;

  FlatCircularButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: highlight,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon,
          // Text(
          //   buttonString,
          //   style: TextStyle(
          //     fontSize: 48,
          //     color: neon,
          //   ),
          // ),
        ),
      ),
    );
  }
}