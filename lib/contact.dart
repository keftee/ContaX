import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_manager/style.dart';
import 'package:flutter/material.dart';

Widget contactCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              child: Text(doc['Name'], style: TextStyle(fontWeight: fontWeight), overflow: TextOverflow.ellipsis,),
            ),
          ),
        ),
      ),
    ],
  );
}