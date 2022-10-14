import 'package:flutter/material.dart';
import 'package:quizapp/screens/error.dart';
import 'package:quizapp/screens/loading.dart';
import 'package:quizapp/services/firestore.dart';
import 'package:quizapp/shared/bottom_nav.dart';

import '../services/models.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Topics'),
              ),
              body: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                primary: true,
                children: topics.map((e) => Card(child: Text(e.title),)).toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const ErrorScren();
          }
        });
  }
}
