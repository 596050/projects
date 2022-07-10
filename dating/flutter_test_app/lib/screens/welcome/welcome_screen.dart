import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/screens/signinOrSignUp/signin_or_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            // const Image(
            //   image: AssetImage("assets/OSC.jpeg"),
            // ),
            const Spacer(flex: 3),
            Text(
              "Lemon Drop",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Lemon Drop",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 3),
            FittedBox(
              child: TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninOrSignupScreen(),
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.8),
                            ),
                      ),
                      const SizedBox(width: kDefaultPadding / 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.8),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
