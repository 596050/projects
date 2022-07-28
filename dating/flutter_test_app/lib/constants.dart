import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFFFFF);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color.fromRGBO(30, 29, 37, 1.0);
// Color(0xFF000000);
const kWarningColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

const kSendButtonTextStyle = TextStyle(
  color: kContentColorLightTheme,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
