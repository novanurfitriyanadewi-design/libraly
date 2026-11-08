import 'package:flutter/material.dart';
import 'counter/counter_page.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Aplikasi Counter')),
        body: const CounterPage(),
      ),
    );
  }
}