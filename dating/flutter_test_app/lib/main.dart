import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/chats/chats_screen.dart';
import 'package:flutter_test_app/screens/home/home.dart';
import 'package:flutter_test_app/screens/messages/message_screen.dart';
import 'package:flutter_test_app/theme.dart';

import 'match.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lemon Drop',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'register': (context) => ChatsScreen(),
        'messages': (context) => MessagesScreen(),
        'mainswipe': (context) => MatchScreen(),
      },
    );
  }
}
