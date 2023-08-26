import 'package:flutter/material.dart';
import 'style.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  MyButton({
    super.key,
    required this.buttonText,
    required this.onTap
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 26),
              decoration: BoxDecoration(
                color: textColor1,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(buttonText,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: 22,
                  color: bgColor,
                ),),
              )
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyButton2 extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  IconData icon;
  MyButton2({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.all(25),
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: textColor1,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Row(
              children: [
                Text(buttonText,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: 22,
                  color: bgColor,
                ),),
                SizedBox(width: 10,),
                Icon(icon, color: Colors.white,),
              ],
            ),
          )
        ),
      ),
    );
  }
}