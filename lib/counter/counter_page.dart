import 'package:flutter/material.dart';
import 'counter_display.dart';
import 'counter_buttons.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  void _add() {
    setState(() {
      _counter++;
    });
  }

  void _subtract() {
    if (_counter == 0) return; // tidak boleh minus
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CounterDisplay(value: _counter),
            const SizedBox(height: 32),
            CounterButtons(
              onAdd: _add,
              onSubtract: _subtract,
              onReset: _reset,
            ),
          ],
        ),
      ),
    );
  }
}