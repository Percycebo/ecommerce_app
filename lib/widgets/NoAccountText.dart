import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText();

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: mediaQ.getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(SignUpScreen.routeName);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: mediaQ.getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
