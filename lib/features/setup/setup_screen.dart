import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class SetupScreen extends StatelessWidget {
  /// Constructs a [SetupScreen]
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go home'),
        ),
      ),
    );
  }
}
