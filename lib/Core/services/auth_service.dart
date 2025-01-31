import 'package:enenni/Home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
      }
      // isLoading=true;
    } catch (e) {
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
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint("Error during create user : $e");

      // TO
    } finally {
      // setState(() {
      //   isLoading = false;
      // });
    }
  }
}
  // static Future signup({
  //   required String email,
  //   required String password,
  // }) async {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password);
  // }

