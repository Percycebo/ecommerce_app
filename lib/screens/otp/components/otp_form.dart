import 'package:e_commerce/providers.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class OTPForm extends StatefulWidget {

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
   FocusNode pin2FocusNode=FocusNode();
   FocusNode pin3FocusNode=FocusNode();
   FocusNode pin4FocusNode=FocusNode();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

   void nextField(String value, FocusNode focusNode) {
     if (value.length == 1) {
       focusNode.requestFocus();
     }
   }

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: mediaQ.screenHeight*0.15
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: mediaQ.getProportionateScreenWidth(60),
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: mediaQ.getProportionateScreenWidth(15)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                    ),
                    //focusNode: pin2FocusNode,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: mediaQ.getProportionateScreenWidth(60),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: mediaQ.getProportionateScreenWidth(15)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                    ),
                    focusNode: pin2FocusNode,
                    onChanged: (value) {
                      nextField(value, pin3FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: mediaQ.getProportionateScreenWidth(60),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: mediaQ.getProportionateScreenWidth(15)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                    ),
                    focusNode: pin3FocusNode,
                    onChanged: (value) {
                      nextField(value, pin4FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: mediaQ.getProportionateScreenWidth(60),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: mediaQ.getProportionateScreenWidth(15)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(15)),
                        borderSide: BorderSide(color: kTextColor),
                      ),
                    ),
                    focusNode: pin4FocusNode,
                    onChanged: (value) {
                      //nextField(value, pin2FocusNode);
                      pin4FocusNode.unfocus();
                    },
                  ),
                ),
              ],
            ),
          SizedBox(
            height: mediaQ.getProportionateScreenHeight(150),
          ),
          DefaultButton(text: 'Continue', press: (){})
        ],
      ),
    );
  }

}
