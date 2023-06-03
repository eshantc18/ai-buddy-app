import 'package:ai_buddy/assets/colors.dart';
import 'package:ai_buddy/provider/modelProvider.dart';
import 'package:ai_buddy/screens/bottomNavigator.dart';
import 'package:ai_buddy/screens/hamburger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => modelProvider()),
      ],
      child: MaterialApp(
        title: 'AI Buddy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(color: cardColor),
        ),
        home: const MyHomePage(title: 'AI Buddy'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(0),
      appBar: AppBar(
        elevation: 5,
        title: const Text("AI Buddy"),
        centerTitle: true,
      ),
      drawer: NavigatorDrawer(),
      body: Center(
        child: Text('Welcome to AI Buddy !!'),
      ),
    );
  }
}
