import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unit_conversion/homepage.dart';
import 'package:unit_conversion/login.dart';
import 'package:unit_conversion/verify.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if(snapshot.hasData) {
            if(snapshot.data!.emailVerified)
            {
              return HomePage();
            }
            else
            {
              return Verify();
            }
          } else {
            return const LoginPage();
          }
        }),
    );
  }
}