import 'package:chatapp/components/message.dart';
import 'package:chatapp/models/messagemodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';

class Chatpage extends StatelessWidget {
  Chatpage({super.key});
  static String id = "chatpage";
  final ScrollController _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagecolletion);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(datetime, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
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
                      reverse: true,
                      controller: _controller,
                      itemCount: messagelist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return messagebuble(
                          message: messagelist[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        messages.add({
                          'message': value,
                          datetime: DateTime.now(),
                          'ID': email
                        });
                        controller.clear();
                        _controller.animateTo(
                          0,
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.send, color: kPrimaryth),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ));
        } else
          return Text("loading");
      },
    );
  }
}
