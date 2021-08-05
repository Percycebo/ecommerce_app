import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/otp/components/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(15)),
            child: Column(
              children: [
                Text('OTP Verification',style: TextStyle(
                  fontSize: mediaQ.getProportionateScreenWidth(25),
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('We sent your code to +2774 5869 *** \n This code will expire in ',
                  textAlign: TextAlign.center,),
                buildTimer(),
                OTPForm(),
                SizedBox(
                  height: mediaQ.getProportionateScreenHeight(20),
                ),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child){
            //int var=int.tryParse(value);
           int variable=0;
           print(int.tryParse(value.toString()));
           if(int.tryParse(value.toString())==null){
             variable=0;
           }else{
           variable=int.tryParse(value.toString())!;}
            return Text(
            "00:${variable}",
            style: TextStyle(color: kPrimaryColor),
          );
          }
        ),
      ],
    );
  }
}
