import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((e) => e.data());
    var topics = data.map((e) => Topic.fromJson(e));
    return topics.toList();
  }

  Future<Quiz> getQuiz(String id) async {
    var ref = _db.collection('quiz').doc(id);
    var snap = await ref.get();
    return Quiz.fromJson(snap.data() ?? {});
  }

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);
    var data = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz])
      }
    };
    return ref.set(data, SetOptions(merge: true));
  }
}
