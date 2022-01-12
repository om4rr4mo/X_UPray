import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/Utility/TGBL.dart';

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
      return FlutterLogin(
        theme: LoginTheme(
          primaryColor: Theme.of(context).scaffoldBackgroundColor,
          accentColor: Theme.of(context).textTheme.bodyText2!.color,
          cardTheme:
              CardTheme(color: Theme.of(context).iconTheme.color, elevation: 0),
        ),
        disableCustomPageTransformer: true,
        messages: LoginMessages(
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
              await Future.delayed(loginTime);
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
          setState(() {
            loggedIn = true;
          });
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => TrackerPage(),
          // ));
        },
        onRecoverPassword: _recoverPassword,
        showDebugButtons: false,
        hideProvidersTitle: true,
      );
    }
  }
}
