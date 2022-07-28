import 'package:flutter/material.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';
  
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
    );
  }
}
