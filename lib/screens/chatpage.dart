import 'package:chatapp/components/message.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});
  static String id = "chatpage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                KPphoto,
                height: 50,
              ),
              Text("chat")
            ],
          ),
          backgroundColor: kPrimarycolor,
        ),
        body: messagebuble());
  }
}
