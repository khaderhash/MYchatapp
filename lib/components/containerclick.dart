import 'package:flutter/material.dart';

import '../constants.dart';

class conclickclass extends StatelessWidget {
  conclickclass({super.key, required this.Texts});
  String Texts;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimarycolor, borderRadius: BorderRadius.circular(22)),
      width: double.infinity,
      height: 60,
      child: Center(
          child: Text(
        Texts,
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}
