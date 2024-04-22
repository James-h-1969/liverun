import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/login.dart';
import 'firebase_options.dart'; // import the firebase core
import './functions/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    authService myAuthService = authService();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyLogin(auth: myAuthService),
      routes: {
        "/home": (context) => MyHomePage(auth: myAuthService),
        "/login": (context) => MyLogin(auth: myAuthService)
      },
    );
  }
}

