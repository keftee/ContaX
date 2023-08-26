import 'package:contact_manager/auth_page_register.dart';
// import 'package:contact_manager/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snaphot) {
          //user logged in
          if(snaphot.hasData) {
            return HomePage();
          }

          //user not logged in
          else {
            return AuthPageRegister();
          }
        }
      ),
    );
  }
}