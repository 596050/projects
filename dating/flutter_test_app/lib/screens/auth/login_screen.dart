//Packages
import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/screens/auth/register_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

//Services
import '../../providers/authentication_provider.dart';
import '../../services/navigation_service.dart';
//Widgets
import '../../widgets/custom_input_fields.dart';
import '../../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late double _deviceHeight;
  late double _deviceWidth;

  late AuthenticationProvider _auth;
  late NavigationService _navigation;

  final _loginFormKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationService>();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.03,
          vertical: _deviceHeight * 0.01,
        ),
        height: _deviceHeight,
        width: _deviceWidth,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            _pageTitle(),
            _loginForm(),
            _loginButton(),
            _registerAccountLink(),
            SizedBox(
              height: _deviceHeight * 0.001,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      height: _deviceHeight * 0.14,
      child: Scaffold(
        body: Center(
          child: Container(
            height: 157.5,
            width: 81.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/ice-cream.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // const Text(
  // 'Lemon Drop',
  // style: TextStyle(
  // color: Colors.white,
  // fontSize: 40,
  // fontWeight: FontWeight.w600,
  // ),
  // )

  Widget _loginForm() {
    return Container(
      height: _deviceHeight * 0.2,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              onSaved: (_value) {
                setState(() {
                  _email = _value;
                });
              },
              regEx:
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              hintText: "Email",
              obscureText: false,
            ),
            CustomTextFormField(
              onSaved: (_value) {
                setState(() {
                  _password = _value;
                });
              },
              regEx: r".{8,}",
              hintText: "Password",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
      name: "Login",
      height: _deviceHeight * 0.065,
      width: _deviceWidth * 0.65,
      onPressed: () {
        if (_loginFormKey.currentState!.validate()) {
          _loginFormKey.currentState!.save();
          _auth.loginUsingEmailAndPassword(_email!, _password!);
        }
      },
    );
  }

  Widget _registerAccountLink() {
    return GestureDetector(
      onTap: () => _navigation.navigateToRoute(RegisterScreen.id),
      child: Container(
        child: const Text(
          'Don\'t have an account?',
          style: TextStyle(
              color: kContentColorLightTheme,
              decoration: TextDecoration.underline),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
