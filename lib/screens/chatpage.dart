import 'package:chatapp/components/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';

class Chatpage extends StatelessWidget {
  Chatpage({super.key});
  static String id = "chatpage";
  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagecolletion);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: messages.doc('0VjyLQIUeURihp9QxVac').get(),
      builder: (context, snapshot) {
        print(snapshot.data!['message']);
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
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({'message': value});
                      controller.clear();
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.send, color: kPrimaryth),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                )
              ],
            ));
      },
    );
  }
}
