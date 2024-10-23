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
    var user = await auth.currentUser!.email;
    return user;
  }

  
  register(name, email, password) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
      await user.user!.updateDisplayName(name);
    } catch (e) {
      throw e;
    }
  }
}
