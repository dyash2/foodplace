
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/restpwScreen";
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();

  // Function to send a password reset email
  void sendPasswordResetEmail(BuildContext context) {
    auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
      Utils().toastMessage("Check your email for a password reset link.");
    }).onError((error, stackTrace) {
      print("Error sending password reset email: $error");
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Helper.getTheme(context).titleLarge,
                ),
                Spacer(),
                Text(
                  "Please enter your email to receive a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 2),
                CustomTextInput(
                  controller:
                      emailController, // Link the controller to the email input field
                  hintText: "Email",
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      sendPasswordResetEmail(context);
                    },
                    child: Text("Send"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Utils {
  void toastMessage(String message) {
  }
}
