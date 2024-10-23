import 'package:chatapp/components/custometextfield.dart';
import 'package:chatapp/screens/register.dart';
import 'package:flutter/material.dart';

import '../components/containerclick.dart';
import '../constants.dart';

class loginpage extends StatelessWidget {
  loginpage({super.key});
  static String id = "login";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              textfieldclass(
                hinttext: 'user name',
              ),
              const SizedBox(
                height: 10,
              ),
              textfieldclass(
                hinttext: 'password',
              ),
              const SizedBox(
                height: 23,
              ),
              conclickclass(
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
    );
  }
}
