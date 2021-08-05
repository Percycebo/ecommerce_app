import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Column(
      children: [
    SizedBox(
      height: mediaQ.screenHeight*0.04,
    ),
        Image.asset('assets/images/success.png',
        height: mediaQ.screenHeight*0.4,
        fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: mediaQ.screenHeight*0.1,
        ),
        Text('Login Successful',style: TextStyle(
          fontSize: mediaQ.getProportionateScreenWidth(20),
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
        Spacer(),
        SizedBox(
          width: mediaQ.getProportionateScreenWidth(140),
            child: DefaultButton(text: 'Continue', press: (){
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            })),
        Spacer()

      ],
    );
  }
}
