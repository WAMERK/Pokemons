import 'package:flutter/material.dart';
import 'package:pokemon/routes.dart';
import 'package:pokemon/ui/Pages/SplashScreenPage/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.getRoutes,
      initialRoute: Routes.splashScreen,
    );
  }
}
