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
          backgroundColor: kPrimaryth,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return messagebuble();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.send, color: kPrimaryth),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            )
          ],
        ));
  }
}
