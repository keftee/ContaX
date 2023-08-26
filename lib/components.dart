import 'package:flutter/material.dart';
import 'style.dart';
class MyTextField extends StatelessWidget {
  
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  style: TextStyle(fontWeight: fontWeight, color: textColor1),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: hintText,
                  hintStyle: TextStyle(fontWeight: fontWeight, color: Colors.grey[800])
                  
                  ),
                ),
              );
  }
}