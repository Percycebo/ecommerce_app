import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/sign_up/components/form.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQ.screenWidth*0.05),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Complete Profile',style: TextStyle(
                color: Colors.black,
                fontSize: mediaQ.getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold
              ),
              ),
              Text('Complete your details or continue \n with social media',textAlign: TextAlign.center,),
              CompleteProfileForm(),
              SizedBox(
                height: mediaQ.screenHeight*0.01,
              ),
              Text("By continuing your confirm that you agree \nwith our Term and Condition",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,)
            ],
          ),
        ),
      ),
    );
  }
}
