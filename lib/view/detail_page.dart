import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/home_page.dart';

class DetailPage extends StatelessWidget {
  Map user;
  DetailPage({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(user['firstName']),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Voltar para Home'))),
    );
  }
}
