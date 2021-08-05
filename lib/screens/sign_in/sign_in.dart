import 'package:e_commerce/screens/sign_in/components/Body.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatelessWidget {
  static String routeName='sign in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign In',textAlign: TextAlign.center,)),
      ),
      body: Body(),
    );
  }
}
