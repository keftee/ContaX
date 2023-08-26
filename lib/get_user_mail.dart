import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/style.dart';
import 'package:flutter/material.dart';

class GetUserMail extends StatelessWidget {
  final String documentID;
  GetUserMail({required this.documentID});

  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference names = FirebaseFirestore.instance.collection('Contacts');

    return FutureBuilder(
      future: names.doc(documentID).get(),
      builder: ((context,snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['Email']}',style: TextStyle(fontWeight: fontWeight, fontSize: fontSize,color: textColor1),);
        }
        return Text('Loading...', style: TextStyle(color: textColor1),);
    }),
    );
  }
}