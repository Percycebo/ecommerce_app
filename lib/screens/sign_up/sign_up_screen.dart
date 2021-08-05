import 'package:e_commerce/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  static String routeName='Sign Up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Sign Up')
        ),
      ),
      body: Body(),
    );
  }
}
