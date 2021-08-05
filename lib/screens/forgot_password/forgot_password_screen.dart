import 'package:e_commerce/screens/forgot_password/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ForgotPasswordScreen extends StatelessWidget {
  static String routeName='forgot password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password',textAlign: TextAlign.center,),
      ),
      body: Body(),
    );
  }
}
