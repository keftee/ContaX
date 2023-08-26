import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
String email='hi';
class GetUserMail extends StatelessWidget {
  final String documentID;
  final user = FirebaseAuth.instance.currentUser!;
  GetUserMail({required this.documentID,super.key});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference names = FirebaseFirestore.instance.collection(user.email!);

    return FutureBuilder(
      future: names.doc(documentID).get(),
      builder: ((context,snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          email = data['Email'];
          print(email);
          return Text('${data['Email']}',style: TextStyle(fontWeight: fontWeight, fontSize: fontSize,color: textColor1),);
        }
        return Text('Loading...', style: TextStyle(color: textColor1),);
    }),
    );
  }
}