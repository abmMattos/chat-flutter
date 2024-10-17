import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/services/auth_service.dart';

class FirestorageService {

  var db = FirebaseFirestore.instance;

  postFeedback(message) async {

    try {
      var feedback = await db.collection('Feedbacks').add({
        "user": await FirebaseAuthService().checkUser(),
        "message": message,
        "photo": "",
        "date": DateTime.now()
      });
      return feedback;
    } catch (e) {
      throw e;
    }
  }

  getFeedbacks() async {
    try {
      var feedbacks = await db.collection('Feedbacks').orderBy('date', descending: true).get();
      return feedbacks.docs;
    } catch (e) {
      throw e;
    }
  }
}