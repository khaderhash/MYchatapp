import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/containerclick.dart';
import '../components/custometextfield.dart';
import '../constants.dart';

class registerpage extends StatelessWidget {
  registerpage({super.key});
  static String id = "register";
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ListView(children: [
            SizedBox(
              height: 75,
            ),
            Image.asset('assets/photo/chat_app_logo.png', height: 150),
            const Text(
              textAlign: TextAlign.center,
              "chat app",
              style: TextStyle(
                  fontFamily: 'RobotoSlab', fontSize: 32, color: kPrimarycolor),
            ),
            SizedBox(
              height: 75,
            ),
            const Text("Register page",
                style: TextStyle(color: kPrimarycolor, fontSize: 26)),
            const SizedBox(
              height: 10,
            ),
            textfieldclass(
              onchange: (p0) {
                email = p0;
              },
              hinttext: 'user name',
            ),
            const SizedBox(
              height: 10,
            ),
            textfieldclass(
              onchange: (p0) {
                password = p0;
              },
              hinttext: 'password',
            ),
            const SizedBox(
              height: 23,
            ),
            conclickclass(
              ontap: () async {
                try {
                  var auth = FirebaseAuth.instance;
                  UserCredential user =
                      await auth.createUserWithEmailAndPassword(
                          email: email!, password: password!);
                } on FirebaseAuthException catch (ex) {
                  if (ex.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(('The password provided is too weak'))));
                  } else if (ex.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            ('The account already exists for that email.'))));
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(('success'))));
                } catch (e) {
                  print(e);
                }
              },
              Texts: 'Register',
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: kPrimarycolor),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
