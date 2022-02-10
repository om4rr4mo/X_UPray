import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Utility/TGBL.dart';
import '../Utility/auth_exception_handler.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  static Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(
        displayName: name, photoURL: currentUser.photoURL);
    await currentUser.reload();
  }

  // Email & Password Sign Up
  static Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      return (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      print('Exception @createAccount: $e');
      ShowToastError(message: AuthExceptionHandler.generateExceptionMessage(e));
      return null;
    }
    // Update the username
    //await updateUserName(name, authResult.user);
  }

  // Email & Password Log In
  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      return (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      print('Exception @createAccount: $e');
      ShowToastError(message: AuthExceptionHandler.generateExceptionMessage(e));
      return null;
    }
  }

  // Sign Out
  static signOut() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.signOut();
  }

  // Reset Password
  static Future sendPasswordResetEmail(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.sendPasswordResetEmail(email: email);
  }

  //Google Login
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        return (await auth.signInWithCredential(credential)).user;
      } catch (e) {
        print('Exception @createAccount: $e');
        ShowToastError(
            message: AuthExceptionHandler.generateExceptionMessage(e));
        return null;
      }
    }
  }

  // static Future<void> signOut({@required BuildContext context}) async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //   try{
  //     if(!kIsWeb){
  //       await googleSignIn.signOut();
  //     }
  //     await FirebaseAuth.instance.signOut();
  //   }catch (e) {
  //     Scaffold.of(context).showSnackBar(
  //       CustomSnackBar(
  //         content: 'Log out non riuscito. Riprova',
  //       ),
  //     );
  //   }
  // }

  static Future createUserWithPhone(String phone, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 0),
        verificationCompleted: (AuthCredential authCredential) {
          auth.signInWithCredential(authCredential).then((result) {
            Navigator.of(context).pushReplacementNamed('/home');
          }).catchError((e) {
            return "error";
          });
        },
        verificationFailed: (Exception exception) => "error",
        codeSent: (String? verificationId, [int? forceResendingToken]) {
          final _codeController = TextEditingController();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Enter Verification Code From Text Message"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[TextField(controller: _codeController)],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("submit"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    var _credential = PhoneAuthProvider.credential(
                        verificationId: verificationId!,
                        smsCode: _codeController.text.trim());
                    auth.signInWithCredential(_credential).then((result) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    }).catchError((e) {
                      return "error";
                    });
                  },
                )
              ],
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        });
  }
}
