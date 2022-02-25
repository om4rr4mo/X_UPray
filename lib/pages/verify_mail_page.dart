import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prayers/Utility/TGBL.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen>
    with TickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  late User user;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (user.emailVerified) {
        timer.cancel();
      } else {
        checkEmailVerified();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width * 0.90,
                height: 300,
                child: Lottie.asset('assets/lotties/splashverify.json')),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "E' stata inviata una mail a ${user.email} per verificare il tuo account",
                  textAlign: TextAlign.center,
                )),
          ),
        ]),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      userLogged = user;
      Navigator.of(context).pop();
    }
  }
}
