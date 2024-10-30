import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';

class textfieldclass extends StatelessWidget {
  textfieldclass({super.key, required this.hinttext, this.onchange});
  String hinttext;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onchange,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: kPrimarycolor, fontSize: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimarycolor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimarycolor))));
  }
}
