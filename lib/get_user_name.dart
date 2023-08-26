import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:contact_manager/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetUserName extends StatelessWidget {
  final String documentID;
  final user = FirebaseAuth.instance.currentUser!;
  TextStyle ts;
  GetUserName({required this.documentID, required this.ts, super.key});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference names = FirebaseFirestore.instance.collection(user.email!);

    return FutureBuilder(
      future: names.doc(documentID).get(),
      builder: ((context,snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['Name']}',style: ts,);
        }
        return Text('Loading...', style: ts,);
    }),
    );
  }
}