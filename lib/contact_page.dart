// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/style.dart';
import 'package:flutter/material.dart';
// import 'style.dart';
import 'get_user_mail.dart';
import 'get_user_name.dart';
import 'get_user_number.dart';
class ContactPage extends StatelessWidget {
  final String docID;
  ContactPage ({required this.docID});
  // QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SafeArea(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_rounded)),
              const SizedBox(width: 20,),
              GetUserName(documentID: docID, ts: TextStyle(fontWeight: fontWeight, color: textColor1,),),//Text("Add a New Contact", style: TextStyle(fontWeight: fontWeight),),
            ],
          ),
        )),
      ),
//GetUserName(documentID: docID, ts: TextStyle(fontWeight: fontWeight, color: textColor1, fontSize: 40),),
      body: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.phone),
                  SizedBox(width: 20,),
                  //Text('Phone Number: ',style: TextStyle(fontSize: fontSize, color: textColor1),),
                  GetUserNumber(documentID: docID),
                ],
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.email),
                  SizedBox(width: 20,),
                 // Text('Email: ', style: TextStyle(fontSize: fontSize, color: textColor1),),
                  GetUserMail(documentID: docID),
                ],
              ),
            )
          ],
        ),
    );
  }
}