import 'package:e_commerce/constants.dart';
import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  DefaultButton({required this.text,required this.press});

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return SizedBox(
      width: double.infinity,
      height: mediaQ.getProportionateScreenHeight(45),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
         backgroundColor: kPrimaryColor
        ),
        child: Text(text,
        style: TextStyle(
          fontSize: mediaQ.getProportionateScreenWidth(18),
          color: Colors.white,
        ),),
        onPressed: ()=>press(),
        
      ),
    );
  }
}
