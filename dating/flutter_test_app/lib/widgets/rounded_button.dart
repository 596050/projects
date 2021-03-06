import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';

class RoundedButton extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onPressed;

  const RoundedButton({
    required this.name,
    required this.height,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.25),
        color: kContentColorLightTheme,
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
