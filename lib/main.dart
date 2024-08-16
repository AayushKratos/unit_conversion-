import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unit_conversion/firebase_options.dart';
import 'package:unit_conversion/homepage.dart';
import 'package:unit_conversion/login.dart';
import 'package:unit_conversion/wrapper.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     home: const Wrapper(),
      routes: {
      "login": (context) => LoginPage(),
      "home": (context) => HomePage(),
      },
    );
  }
}

