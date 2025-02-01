import 'package:enenni/Authentication/login_screen.dart';
import 'package:enenni/Common_Widgets/common_textfield.dart';
import 'package:enenni/Core/constant/app_strings.dart';
import 'package:enenni/Core/services/auth_service.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();

  TextEditingController newPasswordcontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController confirmPasswordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppStrings.resetYourPassword,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  AppStrings.email,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                CommonTextfield(
                  labText: AppStrings.enterYourEmail,
                  iconsP: Icons.mail,
                  controler: emailcontroler,
                  validator: AppStrings.enterYourEmail,
                ),
                const SizedBox(
                  height: 14,
                ),
                Center(
                    child: OutlinedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AuthService()
                                .sendPasswordreset(email: emailcontroler.text);
                          }
                        },
                        child: const Text(AppStrings.reset))),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.baclToLogin),
                    // SizedBox(width: 2,),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false,
                          );
                        },
                        child: const Text(AppStrings.login))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
