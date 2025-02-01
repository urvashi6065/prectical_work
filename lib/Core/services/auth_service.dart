import 'package:email_otp/email_otp.dart';
import 'package:enenni/Authentication/otp_verification.dart';
import 'package:enenni/Presntation_screens/Home/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static Future signup({
    required String email,
    required String password,
    required BuildContext context,
    // required bool isLoading,
  }) async {    
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {   
        if (await EmailOTP.sendOTP(email: email)) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("OTP has been sent")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("OTP failed sent")));
        }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => OtpVerification(
                    email: email,
                  )),
          (route) => false,
        );
      }
      // isLoading=true;
    } catch (e) {
      if (e.toString().contains('firebase_auth/invalid-credential')) {
        Fluttertoast.showToast(msg: 'please enter vailde E-mail');
      } else if (e.toString().contains('firebase_auth/invalid-email')) {
        Fluttertoast.showToast(msg: 'The email address is badly formatted.');
      } else if (e.toString().contains('firebase_auth/email-already-in-use')) {
        Fluttertoast.showToast(msg: 'This Email is already use');
      }
      debugPrint("Error during create user : $e");
    } finally {
      //  setState(() {
      //   isLoading = false;
      // });
    }
  }

  static Future login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    // setState(() {
    //   isLoading = true;
    // });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        print('login print');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      if (e.toString().contains('firebase_auth/invalid-credential')) {
        Fluttertoast.showToast(
            msg: 'Signup after login other wise cheak your email & password');
      }
      debugPrint("Error during create user : $e");

      // TO
    } finally {
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  Future<void> sendPasswordreset({required String email}) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        Fluttertoast.showToast(
            msg:
                'We have sent you email to recover password, please cheak email');
      }).onError((error, StackTrace) {
        Fluttertoast.showToast(msg: error.toString());
      });
    } catch (e) {}
  }
}
  // static Future signup({
  //   required String email,
  //   required String password,
  // }) async {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password);
  // }

