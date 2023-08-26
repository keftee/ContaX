import 'package:contact_manager/register_page.dart';
import 'package:contact_manager/sign_in.dart';
import 'package:flutter/material.dart';

class AuthPageRegister extends StatefulWidget {
  const AuthPageRegister({super.key});

  @override
  State<AuthPageRegister> createState() => _AuthPageRegisterState();
}

class _AuthPageRegisterState extends State<AuthPageRegister> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return signIn(showRegisterPage: toggleScreens,);
    } else {
      return RegisterPage(showLoginPage: toggleScreens,);
    }
  }
}