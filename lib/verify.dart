import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_conversion/wrapper.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  void initState() {
    sendVerifyLink();
    super.initState();
  }

  sendVerifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
          Get.snackbar('Link sent','Open your email',
              margin: const EdgeInsets.all(30),
              snackPosition: SnackPosition.BOTTOM)
        });
  }

  reload()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value) => {Get.offAll(Wrapper())});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verification")),
      body: Padding(padding: const EdgeInsets.all(30),
      child: Center(
        child: Text("Open your Email ID and click on the link provided"),
      )
      ),

      floatingActionButton: FloatingActionButton(onPressed: (()=>reload()),
      child: Icon(Icons.restart_alt_rounded)),
    );
  }
}
