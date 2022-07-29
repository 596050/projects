import 'package:flutter/material.dart';
import 'package:flutter_test_app/match.dart';
// Packages
import 'package:flutter_test_app/providers/authentication_provider.dart';
import 'package:flutter_test_app/screens/auth/login_screen.dart';
import 'package:flutter_test_app/screens/auth/register_screen.dart';
import 'package:flutter_test_app/screens/chats/chats_screen.dart';
import 'package:flutter_test_app/screens/home/home.dart';
import 'package:flutter_test_app/screens/messages/message_screen.dart';
import 'package:flutter_test_app/screens/profile/profile.dart';
import 'package:flutter_test_app/screens/settings/match_settings.dart';
import 'package:flutter_test_app/screens/splash/splash_screen.dart';
import 'package:flutter_test_app/services/navigation_service.dart';
import 'package:flutter_test_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          const MainApp(),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (BuildContext _context) {
          return AuthenticationProvider();
        })
      ],
      child: MaterialApp(
        title: 'Lemon Drop',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (BuildContext context) => LoginScreen(),
          RegisterScreen.id: (BuildContext context) => RegisterScreen(),
          HomeScreen.id: (BuildContext context) => HomeScreen(),
          ChatsScreen.id: (BuildContext context) => ChatsScreen(),
          MessagesScreen.id: (BuildContext context) => MessagesScreen(),
          MatchScreen.id: (BuildContext context) => MatchScreen(),
          MatchSettingsScreen.id: (BuildContext context) =>
              MatchSettingsScreen(),
          ProfileScreen.id: (BuildContext context) => ProfileScreen(),
        },
      ),
    );
  }
}
