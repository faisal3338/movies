import 'package:flutter/material.dart';

import 'core/services/services_locator.dart';
import 'movies/presentation/screens/movies_screen.dart';


void main() {
  ServicesLocator().init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
