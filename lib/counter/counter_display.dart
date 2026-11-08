import 'package:flutter/material.dart';

/// Menampilkan angka counter.
/// Nilai diterima dari parent lewat constructor (passing data).
class CounterDisplay extends StatelessWidget {
  final int value;

  const CounterDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Nilai Counter',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}