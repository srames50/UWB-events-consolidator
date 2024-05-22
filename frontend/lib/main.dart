import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // Root of application
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'UWB Events',
      home: HomePage(),
    );
  }
}