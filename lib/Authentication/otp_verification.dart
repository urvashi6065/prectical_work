import 'package:enenni/Core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0).copyWith(top: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.cheakYourEmail,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  AppStrings.disWelcomeSignup,
                ),
                SizedBox(
                  height: 14,
                ),
              

                // Center(
                //     child: OutlinedButton(
                //         onPressed: () {
                //            if (formKey.currentState!.validate()) {
                //             AuthService.signup(
                //                 email: emailcontroler.text,
                //                 password: passwordcontroler.text,
                //                 context: context);
                //           }
                //         }, child: Text(AppStrings.signUp))),
                // SizedBox(
                //   height: 14,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(AppStrings.alreadyAccount),
                //     // SizedBox(width: 2,),
                //     TextButton(
                //         onPressed: () {
                //            Navigator.pushAndRemoveUntil(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => LoginScreen()),
                //             (route) => false,
                //           );
                //         },
                //         child: Text(AppStrings.login))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
