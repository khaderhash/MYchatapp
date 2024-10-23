import 'package:flutter/material.dart';

import '../components/containerclick.dart';
import '../components/custometextfield.dart';
class registerpage extends StatelessWidget {
  const registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Container(
        // height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff28293F),
              Color(0xff313853),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Image.asset('assets/photo/chat_app_logo.png', height: 150),
                const Text(
                  textAlign: TextAlign.center,
                  "chat app",
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 32,
                      color: Colors.white),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text("Register page",
                    style: TextStyle(color: Colors.white, fontSize: 26)),
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
                 conclickclass(Texts: 'Register',),
                const SizedBox(
                  height: 10,
                ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont have an account? ",
                        style: TextStyle(color: Colors.white)),
                    GestureDetector(
                     onTap: () {
                       Navigator.pop(context);
                     },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
              ]),
        ),
      ),);

  }
}
