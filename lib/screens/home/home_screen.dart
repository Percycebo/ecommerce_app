import 'package:e_commerce/screens/home/components/body.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  static String routeName='Home Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
