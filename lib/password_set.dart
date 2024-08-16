import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailId = TextEditingController();

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailId.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assests/log.jpeg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 170),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 330, right: 35, left: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailId,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: "Enter Email ID",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: (() => reset()),
                              child: Text("Reset"))
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(30)),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
