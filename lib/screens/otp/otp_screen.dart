import 'package:e_commerce/screens/otp/components/body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  static String routeName='OTP Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Center(
            child: Text('OTP Verification')
        ),
      ),
      body: Body(),
    );
  }
}
