import 'package:ai_buddy/main.dart';
import 'package:ai_buddy/screens/bottomNavigator.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(0),
      body: Text("AI Buddy"),
    );
  }
}
