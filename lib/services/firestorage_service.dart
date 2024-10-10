import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/services/auth_service.dart';

class FirestorageService {

  var db = FirebaseFirestore.instance;

  postFeedback() async {

    try {
      db.collection('Feedbacks').add({
        "user": await FirebaseAuthService().checkUser(),
        "message": "muito bom",
        "photo": "",
        "date": DateTime.now()
      });
    } catch (e) {
      throw e;
    }
  }

}