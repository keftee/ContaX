import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'components.dart';
// import 'my_button.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.showLoginPage});
  final VoidCallback showLoginPage;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameContoller = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController =TextEditingController();
  

  @override
  void dispose() {
    usernameContoller.dispose();
    passwordController.dispose();
    comfirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()) {
        FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: usernameContoller.text.trim(),
          password: passwordController.text.trim(),
    );
    }
  }

  bool passwordConfirmed() {
    if(passwordController.text.trim() == comfirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                //logo
                const SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('ContaX', style: TextStyle(fontWeight: fontWeight, fontSize: 60, color: textColor1),)
                ),
                const SizedBox(height: 40,),
                //welcome back message
                Text("Register Below!",
                style: TextStyle(
                  color: textColor1,
                  fontWeight: fontWeight,
                  fontSize: 20.0
                ),),
        
                const SizedBox(height: 50,),
        
                MyTextField(
                  controller: usernameContoller,
                  hintText: 'Username',
                  obscureText: false,
                ),
        
                const SizedBox(height: 20,),
        
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
        
                const SizedBox(height: 20,),
                MyTextField(
                  controller: comfirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
        
                const SizedBox(height: 10,),
        
                //forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 22.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text("Forgot Password?",
                //       style: TextStyle(
                //         fontWeight: fontWeight
                //       ),),
                //     ],
                //   ),
                // ),
                
                const SizedBox(height: 25,),
                //sign in button
                FloatingActionButton.extended(
                  onPressed: signUp,
                  icon: Icon(Icons.arrow_outward_rounded, color: bgColor,),
                  label: Text('Sign Up', style: TextStyle(fontWeight: fontWeight, fontSize: 20, color: bgColor),),
                  backgroundColor: textColor1,
                ),
        
                const SizedBox(height: 50,),
                //or continue with
                
                  //not a memeber? register now button
        
                // SizedBox(height: 10,),
        
        
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Already a member?",
                      style: TextStyle(fontWeight: fontWeight,fontSize: 12, color: textColor1),),
                      // SizedBox(height: 10,),
                              
                      TextButton(
                        onPressed: widget.showLoginPage,
                        style: const ButtonStyle(elevation: MaterialStatePropertyAll(0),),
                        child: Text("Sign In Here.",
                        style: TextStyle(fontWeight: fontWeight,fontSize: 14, color: Colors.blue.shade800),),
                      ),
                      const SizedBox(height: 38,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}