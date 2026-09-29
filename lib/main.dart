import 'package:flutter/material.dart';

void main() {
  runApp(const LocalSwapApp());
}

class LocalSwapApp extends StatelessWidget {
  const LocalSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalSwap',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LocalSwap'),
        ),
        body: const Center(
          child: Text(
            'Bienvenue sur LocalSwap !',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}