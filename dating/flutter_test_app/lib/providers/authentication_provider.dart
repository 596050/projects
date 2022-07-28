//Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/chat_user.dart';
import 'package:flutter_test_app/screens/auth/login_screen.dart';
import 'package:flutter_test_app/screens/home/home.dart';
import 'package:get_it/get_it.dart';

//Models
import '../models/chat_user.dart';
//Services
import '../services/database_service.dart';
import '../services/navigation_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;

  late ChatUser user;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.updateUserLastSeenTime(_user.uid);
        _databaseService.getUser(_user.uid).then(
          (_snapshot) {
            Map<String, dynamic> _userData =
                _snapshot.data()! as Map<String, dynamic>;
            print("_userData");
            print(_userData);
            user = ChatUser.fromJSON(
              {
                "uid": _user.uid,
                "name": _userData["name"],
                "email": _userData["email"],
                "last_active": _userData["last_active"],
                "image": _userData["imageURL"],
              },
            );
            _navigationService.removeAndNavigateToRoute(HomeScreen.id);
          },
        );
      } else {
        if (_navigationService.getCurrentRoute() != LoginScreen.id) {
          _navigationService.removeAndNavigateToRoute(LoginScreen.id);
        }
      }
    });
  }

  Future<void> loginUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
    } on FirebaseAuthException {
      if (kDebugMode) {
        print("Error logging user into Firebase");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String?> registerUserUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      UserCredential _credentials = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      return _credentials.user!.uid;
    } on FirebaseAuthException {
      if (kDebugMode) {
        print("Error registering user.");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
