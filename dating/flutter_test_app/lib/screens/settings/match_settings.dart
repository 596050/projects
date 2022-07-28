import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/screens/chats/chats_screen.dart';
import 'package:flutter_test_app/screens/profile/profile.dart';

import '../../match.dart';

class MatchSettingsScreen extends StatefulWidget {
  static String id = 'match_settings_screen';

  @override
  State<StatefulWidget> createState() {
    return _MatchSettingsScreenState();
  }
}

class _MatchSettingsScreenState extends State<MatchSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
    );
  }
}
