import 'package:chatapp/screens/login.dart';
import 'package:chatapp/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'loginPage': (context) => loginpage(),
          registerpage.id: (context) => registerpage()
        },
        initialRoute: 'loginPage');
  }
}
