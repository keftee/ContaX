import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'components.dart';
class EditContactPage extends StatelessWidget {
  EditContactPage({super.key});
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  Future addContact(String name, int num, String email) async {
    await FirebaseFirestore.instance.collection(user.email!).add( {
      'Name' : name,
      'Number' : num,
      'Email' : email,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios_rounded, color: textColor1,)),
              const SizedBox(width: 20,),
              Text("Add a New Contact", style: TextStyle(fontWeight: fontWeight,  color: textColor1),),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            // const SizedBox(height: 50,),
          

            // const SizedBox(height: 50,),

            MyTextField(
              controller: nameController,
              hintText: 'Name',
              obscureText: false,
            ),

            const SizedBox(height: 20,),

            MyTextField(
              controller: numberController,
              hintText: 'Number',
              obscureText: false,
            ),

            const SizedBox(height: 20,),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 20,),

            
          ]
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          backgroundColor: textColor1,
                onPressed: () {
                  addContact((nameController.text).trim(), int.parse((numberController.text).trim()), (emailController.text).trim());
                  Navigator.of(context).push(_createRoute());
                },
                label: Text("Save", style: TextStyle(fontWeight: fontWeight, color: bgColor),),
                
                icon: Icon(Icons.save, color: bgColor,),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      var curve = Curves.easeIn;
      var curveTween = CurveTween(curve: curve);
      final tween = Tween(begin: begin, end: end).chain(curveTween);
      final offsetAnimation = animation.drive(tween);

      

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}