import 'package:e_commerce/screens/profile/components/body.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  static String routeName='Complete Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}
