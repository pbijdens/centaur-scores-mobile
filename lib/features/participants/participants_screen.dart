import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class ParticipantsScreen extends StatelessWidget {
  /// Constructs a [ParticipantsScreen]
  const ParticipantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Participants Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go home'),
        ),
      ),
    );
  }
}
