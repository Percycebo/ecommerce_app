import 'package:e_commerce/screens/login_success/components/body.dart';
import 'package:flutter/material.dart';
class LoginSuccessScreen extends StatelessWidget {
  static String routeName='Login Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login Success')),
      ),
      body: Body(),
    );
  }
}
