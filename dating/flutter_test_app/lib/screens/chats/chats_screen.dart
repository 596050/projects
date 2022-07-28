import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: kContentColorLightTheme,
        ),
      ),
    );
  }
}
