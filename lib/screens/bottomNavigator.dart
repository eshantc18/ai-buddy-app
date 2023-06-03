import 'package:ai_buddy/assets/colors.dart';
import 'package:ai_buddy/screens/chat.dart';
import 'package:ai_buddy/screens/chooseAI.dart';
import 'package:ai_buddy/screens/hamburger.dart';
import 'package:ai_buddy/screens/home.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  int _selected;
  BottomNavigator(this._selected);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigatorState();
  }
}

class _BottomNavigatorState extends State<BottomNavigator> {
  void _bottomNavigatorOnTap(int index) {
    setState(() {
      widget._selected = index;

      if (index == 0) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      }

      if (index == 1) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Chat()));
      }

      if (index == 2) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => chooseAI()));
      }

      if (index == 3) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigatorDrawer()));
      }

      if (index == 4) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigatorDrawer()));
      }
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 5,
        currentIndex: widget._selected,
        type: BottomNavigationBarType.fixed,
        backgroundColor: cardColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: ((index) => _bottomNavigatorOnTap(index)),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.model_training_rounded), label: 'AI'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'More',
          ),
        ]);
  }
}
