import 'package:ai_buddy/assets/colors.dart';
import 'package:ai_buddy/screens/home.dart';
import 'package:flutter/material.dart';

class NavigatorDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Drawer(
            child: Column(
              children: [
                Container(
                  color: cardColor,
                  height: constraints.maxHeight * 0.3,
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(constraints.maxHeight * 0.04),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          maxRadius: constraints.maxHeight * 0.07,
                        ),
                      ),
                      Text(
                        'xyz@gmail.com',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  color: backgroundColor,
                  height: constraints.maxHeight * 0.7,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Home',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Home())));
                        },
                        leading: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Change Password',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.password_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Past Chats',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.history_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Clear Chats',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.delete_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Dark Mode',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.dark_mode_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Settings',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Feedback',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.star_outlined,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Share',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'About Us',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {},
                        leading: const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
