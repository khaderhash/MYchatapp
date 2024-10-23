import 'package:flutter/material.dart';

class textfieldclass extends StatelessWidget {
  textfieldclass({super.key, required this.hinttext});
  String hinttext;
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))));
  }
}
