import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/firebase_options.dart';
import 'package:flutter_application_3/view/chat_page.dart';
import 'package:flutter_application_3/view/feedback_page.dart';
import 'package:flutter_application_3/view/home_page.dart';
import 'package:flutter_application_3/view/login_page.dart';
import 'package:flutter_application_3/view/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        useMaterial3: false
      ),
      initialRoute: 'login',
      routes: {
        '/': (context) => HomePage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'feedback': (context) => FeedbackPage(),
        'chat': (context) => ChatPage(),
      },
    ),
  );
}