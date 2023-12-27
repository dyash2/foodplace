import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodplace/screens/introScreen.dart';
import 'package:foodplace/widgets/my_button.dart';
import 'package:foodplace/widgets/my_textfield.dart';
import '../const/colors.dart';
import '../screens/loginScreen.dart';
import '../utils/helper.dart';

final _formKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';
  final Function()? onTap;
  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return "Please enter a Valid Email";
    }
    return null;
  }

  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // trying to creating the user
    try {
      //check if password is confirmed
      if (passwordController.text == ConfirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show the error message,password dont match
        showErrorMessage("Passwords don't match!");
      }
      // pop to the home screen :)
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      showErrorMessage(e.code);
    }
  }

  // wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: Helper.getTheme(context).titleLarge,
                    ),
                    Spacer(),
                    Text(
                      "Add your details to sign up",
                    ),
                    Spacer(),
                    MyTextField(
                      controller: nameController,
                      hintText: 'Name',
                      obscureText: false,
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    MyTextField(
                      controller: mobileController,
                      hintText: 'Mobile No.',
                      obscureText: false,
                      validator: (mobileNo) {
                        if (mobileNo == null || mobileNo.isEmpty) {
                          return 'Mobile No. is required';
                        }
                        if (mobileNo.length != 10) {
                          return 'Mobile No. should be 10 digits';
                        }
                        if (!RegExp(r'^[0-9]*$').hasMatch(mobileNo)) {
                          return 'Mobile No. should contain only digits';
                        }
                        return null;
                      },
                    ),
                    //email button
                    Spacer(),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      validator: validateEmail,
                    ),
                    //password button
                    Spacer(),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Password is required';
                        }
                        if (password.length < 3) {
                          return 'Password should be at least 3 characters';
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    MyTextField(
                      controller: ConfirmpasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      validator: (confirmPassword) {
                        if (confirmPassword == null || confirmPassword.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (confirmPassword != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    MyButton(
                      text: "Sign Up",
                      onTap: signUserUp,
                      formKey: _formKey,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account?"),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: AppColor.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
