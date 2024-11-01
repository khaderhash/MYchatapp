import 'package:chatapp/components/custometextfield.dart';
import 'package:chatapp/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/containerclick.dart';
import '../constants.dart';
import '../helper/snakbarm.dart';

class loginpage extends StatefulWidget {
  loginpage({super.key});
  static String id = "login";

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          body: Container(
            // height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff28293F),
              Color(0xff313853),
            ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: ListView(children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset('assets/photo/chat_app_logo.png', height: 150),
                  const Text(
                    textAlign: TextAlign.center,
                    "chat app",
                    style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 32,
                        color: kPrimarycolor),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  const Text("Sign in",
                      style: TextStyle(color: kPrimarycolor, fontSize: 26)),
                  const SizedBox(
                    height: 10,
                  ),
                  textformfieldclass(
                    hinttext: 'Email',
                    onchange: (p0) {
                      email = p0;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textformfieldclass(
                    hinttext: 'password',
                    onchange: (p0) {
                      password = p0;
                    },
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  conclickclass(
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await loginuser();
                          SnakBM(context, message: 'succsess');
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            SnakBM(context,
                                message: 'The password provided is too weak');
                          } else if (ex.code == 'email-already-in-use') {
                            SnakBM(context,
                                message:
                                    'The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {});
                      }
                    },
                    Texts: 'LOGIN',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("dont have an account? ",
                          style: TextStyle(color: kPrimarycolor)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, registerpage.id);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
