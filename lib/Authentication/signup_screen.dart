import 'package:enenni/Authentication/login_screen.dart';

import 'package:enenni/Common_Widgets/common_textfield.dart';
import 'package:enenni/Core/constant/app_strings.dart';
import 'package:enenni/Core/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

    bool isLoading = false;

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
                  AppStrings.createAnAccount,
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
                Text(
                  AppStrings.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                CommonTextfield(
                  labText: AppStrings.enterYourName,
                  iconsP: Icons.person,
                  controler: namecontroler,
                  validator: AppStrings.enterYourName,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  AppStrings.email,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                CommonTextfield(
                  labText: AppStrings.enterYourEmail,
                  iconsP: Icons.mail,
                  controler: emailcontroler,
                  validator: AppStrings.enterYourEmail,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  AppStrings.password,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                CommonTextfield(
                  labText: AppStrings.enterYourPassword,
                  iconsP: Icons.lock,
                  controler: passwordcontroler,
                  validator: AppStrings.enterYourPassword,
                ),
                SizedBox(
                  height: 14,
                ),
                Center(
                    child: OutlinedButton(
                        onPressed: () {
                           if (formKey.currentState!.validate()) {
                            AuthService.signup(
                                email: emailcontroler.text,
                                password: passwordcontroler.text,
                                context: context);
                          }
                        }, child: Text(AppStrings.signUp))),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.alreadyAccount),
                    // SizedBox(width: 2,),
                    TextButton(
                        onPressed: () {
                           Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false,
                          );
                        },
                        child: Text(AppStrings.login))
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
