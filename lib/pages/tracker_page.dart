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
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    userLogged = (await Authentication.signInWithEmailAndPassword(
        data.name.trim(), data.password.trim()))!;
    return null;
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const VerifyEmailScreen()));
    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    debugPrint('Name: $name');
    await Authentication.sendPasswordResetEmail(name.trim());
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (loggedIn) {
      return const SafeArea(
        child: Center(
          child: Text("TRACKER"),
        ),
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: false,
        body: FlutterLogin(
          theme: LoginTheme(
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21)),
              elevation: 0,
            ),
            inputTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
                borderSide: const BorderSide(width: 2),
              ),
            ),
          ),
          disableCustomPageTransformer: true,
          messages: LoginMessages(
            userHint: "E-mail",
            forgotPasswordButton: "Password dimenticata?",
            providersTitleFirst: "oppure accedi con",
          ),
          title: 'UPRAY',
          logo: const AssetImage('assets/images/mecca.png'),
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
