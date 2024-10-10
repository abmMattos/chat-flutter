import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  
  FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try {
      var user = await auth.signInWithEmailAndPassword(
        email: 'abmmattos0209@gmail.com', 
        password: 'admin123');
    } catch (e) {
      return throw e;
    }
  }

  recoverPassword() async {
    try {
      await auth.sendPasswordResetEmail(
        email: 'abmmattos0209@gmail.com');
      return true;
    } catch (e) {
      return throw e;
    }
  }

  checkUser() async {
    var user = auth.currentUser!.displayName;
    return user;
  }
}
