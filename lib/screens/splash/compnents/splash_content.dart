import 'package:e_commerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SplashContent extends StatelessWidget {
   SplashContent({
     required this.text,
     required this.image,
   });

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Spazza Shop",
          style: TextStyle(
            fontSize: mediaQ.getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: mediaQ.getProportionateScreenHeight(265),
          width: mediaQ.getProportionateScreenHeight(235),
        ),
      ],
    );
  }
}