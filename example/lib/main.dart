import 'package:appsize/appsize.dart';
import 'package:example/screens/home_screen.dart';
import 'package:example/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AppSizes());
}

class AppSizes extends StatefulWidget {
  const AppSizes({super.key});

  @override
  State<AppSizes> createState() => _AppSizesState();
}

class _AppSizesState extends State<AppSizes> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]),
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        ),
      ]);
    });
  }

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
