import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab23_emsi_zekraoui/home_page.dart';
import 'package:lab23_emsi_zekraoui/login_screen.dart';
import 'package:lab23_emsi_zekraoui/pallete.dart';


void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ossama Zekraoui',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}
