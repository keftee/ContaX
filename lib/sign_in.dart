// import 'package:contact_manager/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'components.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'my_button.dart';
class signIn extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const signIn({super.key, required this.showRegisterPage});
  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final usernameContoller = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usernameContoller.text, 
      password: passwordController.text
    );
    // print('signedINNN');
  }
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                Text("Welcome back!, You've been missed!",
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
          
                const SizedBox(height: 10,),
          
                //forgot password?
                
                const SizedBox(height: 25,),
                //sign in button
                // MyButton(
                //   buttonText: 'Sign In', ///////////////////////////////////////////////////////
                //   onTap: signUserIn,
                // ),
                FloatingActionButton.extended(
                  onPressed: signUserIn,
                  icon: Icon(Icons.login_rounded, color: bgColor,),
                  label: Text('Sign In', style: TextStyle(fontWeight: fontWeight, fontSize: 20, color: bgColor),),
                  backgroundColor: textColor1,
                ),
          
                const SizedBox(height: 30,),
                //or continue with
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(thickness: 1, color: textColor1,),
                    )),
                    Text("Or continue with",
                    style: TextStyle(fontSize: 12, fontWeight: fontWeight, color: textColor1),),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(thickness: 1, color: textColor1,),
                      )
                    )
                  ],
                ),
                
                //google sign in button
                const SizedBox(height: 20,),
          
                //  Center(
                //     child: Container(
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Colors.black,
                //         ),
                //         borderRadius: BorderRadius.circular(16),
                //         color: Colors.grey.shade300,
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.all(10.0),
                //         child: Image.asset('lib/images/google_logo.png', height: 45,),
                //       )
                //     ),
                //   ),
                Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // border: Border.all(color: textColor1),
                      color: Colors.grey.shade100,
                    ),
                    
                    child: IconButton(
                      onPressed: signInWithGoogle,
                      icon: const Image(image:AssetImage('lib/images/google_logo.png'),),
                      iconSize: 0,
                    ),
                  )
                ),
                  //not a memeber? register now button
          
                  const SizedBox(height: 25,),
                  Text("Not a member?",
                  style: TextStyle(fontWeight: fontWeight,fontSize: 12, color: textColor1),),
                  // const SizedBox(height: 10,),
          

                  TextButton(
                    
                    onPressed: widget.showRegisterPage,
                    style: const ButtonStyle(elevation: MaterialStatePropertyAll(0),),
                    child: Text("Register Now.",
                    style: TextStyle(fontWeight: fontWeight,fontSize: 14, color: Colors.blue.shade800),),
                  ),
                  const SizedBox(height: 38,)
              ],
            ),
          ),
        ),
      )
    );
  }
}