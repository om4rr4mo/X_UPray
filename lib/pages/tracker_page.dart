import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/pages/verify_mail_page.dart';

import '../providers/firebase_authentication.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    userLogged = (await Authentication.signInWithEmailAndPassword(
        data.name.trim(), data.password.trim()))!;
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    User? user = (await Authentication.createUserWithEmailAndPassword(
        data.name!.trim(), data.password!.trim()))!;

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => VerifyEmailScreen()));
  }

  Future<String?> _recoverPassword(String name) async {
    debugPrint('Name: $name');
    await Authentication.sendPasswordResetEmail(name.trim());
  }

  @override
  Widget build(BuildContext context) {
    if (loggedIn)
      return SafeArea(
        child: Center(
          child: Text("TRACKER"),
        ),
      );
    else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: false,
        body: FlutterLogin(
          //onConfirmSignup: (value, logindata) {},
          theme: LoginTheme(
            primaryColor: Theme.of(context).scaffoldBackgroundColor,
            accentColor: Theme.of(context).textTheme.bodyText2!.color,
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).iconTheme.color,
              elevation: 0,
            ),
            textFieldStyle: TextStyle(
              color: Color(0xFFF6F4F3),
            ),
            inputTheme: InputDecorationTheme(
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, style: BorderStyle.solid),
              ),
            ),
            buttonTheme: LoginButtonTheme(
              backgroundColor: Theme.of(context).shadowColor,
            ),
            buttonStyle: TextStyle(
              color: Color(0xFFF6F4F3),
              fontWeight: FontWeight.bold,
            ),
            pageColorDark: Theme.of(context).scaffoldBackgroundColor,
            pageColorLight: Theme.of(context).scaffoldBackgroundColor,
          ),
          disableCustomPageTransformer: true,
          messages: LoginMessages(
            userHint: "E-mail",
            forgotPasswordButton: "Password dimenticata?",
            providersTitleFirst: "oppure accedi con",
          ),
          title: 'UPRAY',
          logo: AssetImage('assets/images/mecca.png'),
          onLogin: _authUser,
          onSignup: _signupUser,
          loginProviders: <LoginProvider>[
            LoginProvider(
              icon: FontAwesomeIcons.google,
              label: '',
              callback: () async {
                userLogged =
                    (await Authentication.signInWithGoogle(context: context))!;

                if (userLogged != null) {
                  setState(() {
                    loggedIn = true;
                  });
                } else {
                  setState(() {
                    loggedIn = false;
                  });
                }

                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.facebookF,
              label: '',
              callback: () async {
                debugPrint('start facebook sign in');
                await Future.delayed(loginTime);
                debugPrint('stop facebook sign in');
                return null;
              },
            ),
          ],
          onSubmitAnimationCompleted: () {
            setState(() {});
          },
          onRecoverPassword: _recoverPassword,
          showDebugButtons: false,
          hideProvidersTitle: true,
        ),
      );
    }
  }
}
