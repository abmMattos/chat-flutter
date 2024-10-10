import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/custom_button.dart';
import 'package:flutter_application_3/components/custom_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit_note, size: 100,),
            Text('Cadastro', style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            )
          ),
            CustomInput(labelText: 'Nome'),
            CustomInput(labelText: 'E-mail'),
            CustomInput(labelText: 'Telefone'),
            CustomInput(labelText: 'Senha', obscure: true),
            CustomInput(labelText: 'Repita a sua senha', obscure: true),
            CustomButton(titleButton: 'Cadastrar')
          ],
        ),
      ),
    );
  }
}