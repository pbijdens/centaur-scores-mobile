import 'package:centaur_scores_2/data/repositories/configuration_data_repository.dart';
import 'package:centaur_scores_2/data/repositories/configuration_data_repository_impl.dart';
import 'package:centaur_scores_2/features/home_screen.dart';
import 'package:centaur_scores_2/features/participants/participants_screen.dart';
import 'package:centaur_scores_2/features/scores/scores_screen.dart';
import 'package:centaur_scores_2/features/setup/setup_screen.dart';
import 'package:centaur_scores_2/viewmodels/view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() {
  final getIt = GetIt.instance;

  // Service registrations
  getIt.registerLazySingletonAsync<ConfigurationDataRepository>(
    () async => await ConfigurationDataRepositoryImpl.create(),
  );

  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  observers: [routeObserver], // global from view.dart
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'setup',
          builder: (BuildContext context, GoRouterState state) {
            return const SetupScreen();
          },
        ),
        GoRoute(
          path: 'scores',
          builder: (BuildContext context, GoRouterState state) {
            return const ScoresScreen();
          },
        ),
        GoRoute(
          path: 'participants',
          builder: (BuildContext context, GoRouterState state) {
            return const ParticipantsScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Centaur Scores',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade800),
      ),
      routerConfig: _router,
    );
  }
}
