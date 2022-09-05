import 'package:appsize/appsize.dart';
import 'package:example/screens/home_screen.dart';
import 'package:example/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppSizes());
}

class AppSizes extends StatelessWidget {
  const AppSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSize.child(
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sizer',
      theme: ThemeData.light().theme,
      home: const HomeScreen(),
    );
  }
}
