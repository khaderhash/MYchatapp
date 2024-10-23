import 'package:flutter/material.dart';
class conclickclass extends StatelessWidget {
  conclickclass({super.key,required this.Texts});
String Texts;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
