import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = Color(0xFF6750a4);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true).copyWith(
        iconTheme: const IconThemeData(size: 29),
        textTheme: TextTheme(
          labelMedium: TextStyle(fontSize: 21, color: themeColor),
          displayMedium: const TextStyle(fontSize: 17, color: Colors.black),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: const Keys(),
      ),
    );
  }
}
