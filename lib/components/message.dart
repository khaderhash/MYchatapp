import 'package:flutter/material.dart';

import '../constants.dart';

class messagebuble extends StatelessWidget {
  const messagebuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 50,
      alignment: Alignment.centerLeft,
      width: 150,
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: kPrimarycolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Text("hi i am kheder", style: TextStyle(color: Colors.white)),
    );
  }
}
