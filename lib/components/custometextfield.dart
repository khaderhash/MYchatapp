import 'package:chatapp/constants.dart';
import 'package:flutter/material.dart';

class textformfieldclass extends StatelessWidget {
  textformfieldclass({super.key, required this.hinttext, this.onchange});
  String hinttext;

  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'field';
          }
        },
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
