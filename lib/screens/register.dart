import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/containerclick.dart';
import '../components/custometextfield.dart';
import '../constants.dart';
import '../helper/snakbarm.dart';

class registerpage extends StatefulWidget {
  registerpage({super.key});
  static String id = "register";

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  String? email;
  String? password;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
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
                const Text("Register page",
                    style: TextStyle(color: kPrimarycolor, fontSize: 26)),
                const SizedBox(
                  height: 10,
                ),
                textformfieldclass(
                  onchange: (p0) {
                    email = p0;
                  },
                  hinttext: 'user name',
                ),
                const SizedBox(
                  height: 10,
                ),
                textformfieldclass(
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
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await RUser();
                        SnakBM(context, message: 'succsess');
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          SnakBM(context,
                              message: 'user not found');
                        } else if (ex.code == 'worng-password') {
                          SnakBM(context,
                              message:
                                  'There was an error.');
                        }
                      } catch (e) {
                        SnakBM(context, message: 'error');
                      }
                      isloading = false;
                      setState(() {});
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
                    Text("have an account? ",
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
        ),
      ),
    );
  }

  Future<void> RUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
