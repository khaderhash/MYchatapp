import 'package:flutter/material.dart';

import '../constants.dart';

class messagebuble extends StatelessWidget {
  const messagebuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(left: 20, bottom: 20, right: 16, top: 20),
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        decoration: BoxDecoration(
            color: kPrimaryth,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Text("hi i am kheder", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
