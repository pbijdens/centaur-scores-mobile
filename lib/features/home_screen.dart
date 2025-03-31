import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/setup'),
              child: const Text('Go to the Setup screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/participants'),
              child: const Text('Go to the Participants screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/scores'),
              child: const Text('Go to the Scores screen'),
            ),
          ],
        ),
      ),
    );
  }
}
