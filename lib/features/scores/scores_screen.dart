import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class ScoresScreen extends StatelessWidget {
  /// Constructs a [ScoresScreen]
  const ScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scores Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go home'),
        ),
      ),
    );
  }
}
