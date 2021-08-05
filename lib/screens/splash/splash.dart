import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/splash/compnents/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SplashScreen extends StatelessWidget {
  static String routeName='splash screen';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
    );
  }
}
