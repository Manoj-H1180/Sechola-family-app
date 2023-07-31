import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your login screen UI code goes here.
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Center(
        child: Text('This is the Register Screen'),
      ),
    );
  }
}
