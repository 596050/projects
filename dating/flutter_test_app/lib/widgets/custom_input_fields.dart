import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onSaved;
  final String regEx;
  final String hintText;
  final bool obscureText;

  CustomTextFormField(
      {required this.onSaved,
      required this.regEx,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: kPrimaryColor,
      style: const TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : 'Enter a valid value.';
      },
      decoration: InputDecoration(
        fillColor: kContentColorLightTheme,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.84)),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
          color: kPrimaryColor,
          focusColor: kPrimaryColor,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Function(String) onEditingComplete;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  IconData? icon;

  CustomTextField(
      {required this.onEditingComplete,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: () => onEditingComplete(controller.value.text),
      cursorColor: kPrimaryColor,
      style: const TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.clear),
          color: kPrimaryColor,
        ),
        fillColor: kContentColorLightTheme,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.84)),
        prefixIcon: Icon(icon, color: kPrimaryColor.withOpacity(0.84)),
      ),
    );
  }
}
