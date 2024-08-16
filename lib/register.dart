import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:unit_conversion/login.dart';
import 'package:unit_conversion/wrapper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailId = TextEditingController();
  TextEditingController pass = TextEditingController();

  signUp()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailId.text, password: pass.text);
    Get.offAll  (() => Wrapper());
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
                  "Sign Up",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 330,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailId,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: "Enter new Email ID",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      TextField(
                        controller: pass,
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            hintText: "Enter new Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: (()=>signUp()), child: Text("Register"))
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
