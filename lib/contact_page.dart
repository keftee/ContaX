// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/style.dart';
import 'package:flutter/material.dart';
// import 'style.dart';
import 'get_user_mail.dart';
import 'get_user_name.dart';
import 'get_user_number.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactPage extends StatelessWidget {
  final String docID;
  ContactPage ({required this.docID});
  // QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_rounded)),
              const SizedBox(width: 20,),
              GetUserName(documentID: docID, ts: TextStyle(fontWeight: fontWeight, color: textColor1,),),//Text("Add a New Contact", style: TextStyle(fontWeight: fontWeight),),
            ],
          ),
        ),
      ),
//GetUserName(documentID: docID, ts: TextStyle(fontWeight: fontWeight, color: textColor1, fontSize: 40),),
      body: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  IconButton(
                    onPressed: () async {
                      Uri phoneno = Uri.parse('tel:$number');
                      if(true) {
                        //dialer opened
                        await launchUrl(phoneno);
                      }
                    }, 
                    icon: Icon(Icons.phone)
                  ),
                  
                  const SizedBox(width: 20,),
                  //Text('Phone Number: ',style: TextStyle(fontSize: fontSize, color: textColor1),),
                  GetUserNumber(documentID: docID),
                ],
              ),
            ),
            const Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  IconButton(
                    onPressed: () async{
                      Uri Email = Uri.parse('mailto:$email?subject=''&body=''');
                      await launchUrl(Email);
                    },
                    icon:  const Icon(Icons.email),),
                  const SizedBox(width: 20,),
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