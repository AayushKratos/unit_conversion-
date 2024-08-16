import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_conversion/homepage.dart';
import 'package:unit_conversion/password_set.dart';
import 'package:unit_conversion/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailId = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isLoading = false;
  signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailId.text, password: pass.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Found", e.code);
    } catch (e) {
      Get.snackbar("Error Found", e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
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
                        "Welcome\nBack",
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
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            Padding(padding: EdgeInsets.all(20)),
                            TextField(
                              controller: pass,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            Padding(padding: EdgeInsets.all(20)),
                            ElevatedButton(
                                onPressed: (() => signIn()),
                                child: Text("Login")),
                            SizedBox(height: 30),
                            ElevatedButton(
                                onPressed: (() => Get.to(() => RegisterPage())),
                                child: Text("Register")),
                            SizedBox(height: 30),
                            ElevatedButton(
                                onPressed: (() =>
                                    Get.to(() => ForgotPassword())),
                                child: Text("Forgot Password?")),
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
