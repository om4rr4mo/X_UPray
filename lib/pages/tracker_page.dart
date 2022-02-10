import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/Utility/TGBL.dart';

import '../providers/firebase_authentication.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
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
                debugPrint('start google sign in');
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
                debugPrint('stop google sign in');
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
            //LoginProvider(
            //  icon: FontAwesomeIcons.linkedinIn,
            //  label: "LinkedIn",
            //  callback: () async {
            //    debugPrint('start linkdin sign in');
            //    await Future.delayed(loginTime);
            //    debugPrint('stop linkdin sign in');
            //    return null;
            //  },
            //),
            //LoginProvider(
            //  icon: FontAwesomeIcons.githubAlt,
            //  label: "GitHub",
            //  callback: () async {
            //    debugPrint('start github sign in');
            //    await Future.delayed(loginTime);
            //    debugPrint('stop github sign in');
            //    return null;
            //  },
            //),
          ],
          onSubmitAnimationCompleted: () {
            setState(() {});
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => TrackerPage(),
            // ));
          },
          onRecoverPassword: _recoverPassword,
          showDebugButtons: false,
          hideProvidersTitle: true,
        ),
      );
    }
  }
}
