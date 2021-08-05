import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/sign_in/components/form.dart';
import 'package:e_commerce/widgets/NoAccountText.dart';
import 'package:e_commerce/widgets/socialcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediaQ.getProportionateScreenWidth(20)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQ.screenHeight*0.01,
                  ),
                  Text('Welcome',style: TextStyle(
                    color: Colors.black,
                    fontSize: mediaQ.getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text("Sign in with your email and password \n continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: mediaQ.screenHeight*0.04,
                  ),
                  SignInForm(),
                  SizedBox(
                    height: mediaQ.screenHeight*0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQ.screenHeight*0.04,
                  ),
                  NoAccountText(),
                  SizedBox(
                    height: mediaQ.screenHeight*0.04,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
