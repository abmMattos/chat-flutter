import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  String labelText;
  bool obscure;
  // TextEditingController controller;

  CustomInput({
    super.key, 
    required this.labelText, 
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          filled: true,
          fillColor: const Color.fromARGB(255, 224, 224, 224)
        ),
      ),
    );
  }
}