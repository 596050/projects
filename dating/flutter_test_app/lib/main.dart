import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/chats/chats_screen.dart';
import 'package:flutter_test_app/screens/home/home.dart';
import 'package:flutter_test_app/screens/messages/message_screen.dart';
import 'package:flutter_test_app/screens/splash/splash_screen.dart';
import 'package:flutter_test_app/theme.dart';

import 'match.dart';
import 'screens/profile/profile.dart';
import 'screens/settings/match_settings.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          MainApp(),
        );
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lemon Drop',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ChatsScreen.id: (context) => ChatsScreen(),
        MessagesScreen.id: (context) => MessagesScreen(),
        MatchScreen.id: (context) => MatchScreen(),
        MatchSettingsScreen.id: (context) => MatchSettingsScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
