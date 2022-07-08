import 'package:flutter/material.dart';

class LoginElevatedButtonWidget extends StatelessWidget {
  const LoginElevatedButtonWidget(
      {Key? key,
      required this.child,
      required this.onTap,
      required this.height,
      required this.width,
      required this.buttonColor})
      : super(key: key);
  final Widget child;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: child,
      ),
    );
  }
}
