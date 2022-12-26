import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagment/logger_riverpod.dart';
import 'package:riverpod_statemanagment/ui/home.dart';

void main() {
  runApp( ProviderScope(
    observers: [
      LoggerRiverpod()
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Management',
      theme: FlexThemeData.light(scheme: FlexScheme.ebonyClay),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.barossa),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
