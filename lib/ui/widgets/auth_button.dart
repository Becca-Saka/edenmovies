import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  final Color color;
  final bool hasRadius;
  const AuthButton({
    Key? key,
    required this.height,
    required this.onPressed,
    required this.text,
    this.color = Colors.white,
    this.hasRadius = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(hasRadius ? 5 : 0))),
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                  color: color == Colors.white ? Colors.black : Colors.white,
                  fontSize: 16))),
    );
  }
}
