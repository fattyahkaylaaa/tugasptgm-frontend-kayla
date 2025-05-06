import 'package:bukuxirplb/config/routes.dart';
import 'package:bukuxirplb/pages/login/login_pages2.dart';
import 'package:bukuxirplb/provider/auth_provider.dart';
import 'package:bukuxirplb/provider/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TokenProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider())
    ],
    child: const MyApp(),
  ));
  /*
  runApp(const MyApp());
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      routes: appRoutes,
    );
  }
}