import 'package:flutter/material.dart';
import 'package:mvvm_example/core/routes/app_routes.dart';
import 'package:mvvm_example/core/themes/app_themes.dart';
import 'package:mvvm_example/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM Example',
      theme: AppThemes.darkTheme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
      },
    );
  }
}