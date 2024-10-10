import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {

  String image;

  SocialAuth({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),  
      child: Image.network(image, fit: BoxFit.fill,),        
    );
  }
}