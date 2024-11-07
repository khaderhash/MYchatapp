import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/messagemodel.dart';

class messagebuble2 extends StatelessWidget {
  messagebuble2({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 20, bottom: 20, right: 16, top: 20),
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
