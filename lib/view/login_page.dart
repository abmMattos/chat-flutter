import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/custom_button.dart';
import 'package:flutter_application_3/components/custom_input.dart';
import 'package:flutter_application_3/components/social_auth.dart';
import 'package:flutter_application_3/services/auth_service.dart';
import 'package:flutter_application_3/view/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 180),
            CustomInput(labelText: 'E-mail'),
            CustomInput(labelText: 'Senha', obscure: true,),
            CustomButton(
              titleButton: 'Entrar'
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage()
                      ),
                    );
                  },
                  child: Text('Cadastre-se'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialAuth(image: 'https://cdn-icons-png.flaticon.com/128/3536/3536394.png',),
                SocialAuth(image: 'https://cdn-icons-png.flaticon.com/128/2875/2875404.png',),
                SocialAuth(image: 'https://cdn-icons-png.flaticon.com/128/3536/3536505.png',),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Esqueceu a senha?'),
                TextButton(
                  onPressed: () async {
                    await FirebaseAuthService().recoverPassword();
                  },
                  child: Text('Clique aqui'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}