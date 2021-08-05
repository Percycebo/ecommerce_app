import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:e_commerce/widgets/form_error.dart';
import 'package:e_commerce/widgets/socialcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(15)),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: mediaQ.screenHeight*0.02,),
              Text('Register Account',
                style: TextStyle(
                fontSize: mediaQ.getProportionateScreenWidth(25),
                color: Colors.black
          ),
              ),
            Text('Complete your details or continue \n with social media',textAlign: TextAlign.center,),
              SizedBox(
                height: mediaQ.getProportionateScreenHeight(20),
              ),
              BuildForm(),
              SizedBox(
                height: mediaQ.getProportionateScreenHeight(10),
              ),

              SizedBox(
                height: mediaQ.getProportionateScreenHeight(30),
              ),
              DefaultButton(
                text: 'Continue',
                press: (){
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
              ),
              SizedBox(
                height: mediaQ.getProportionateScreenHeight(10),
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
                height: mediaQ.getProportionateScreenHeight(10),
              ),
              Text('By continuing your confirming that you agree \n with our Term and Condition',textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}

class BuildForm extends StatefulWidget {

  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword='';
  final List<String> errors=[];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextFormField(),
          SizedBox(
            height: mediaQ.getProportionateScreenHeight(25),
          ),
          buildPasswordTextFormField(),
          SizedBox(
            height: mediaQ.getProportionateScreenHeight(25),
          ),
          buildConfirmPasswordTextFormField(),
          SizedBox(
            height: mediaQ.getProportionateScreenHeight(25),
          ),
          FormError(errors: errors),
        ],
      ),
    );
  }


  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",

          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/icons/Lock.svg',
              width: 6,
              height: 20,
              fit: BoxFit.contain,
            ),
          )
      ),
    );
  }

  TextFormField buildConfirmPasswordTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty&&password==confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword=value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (confirmPassword!=password){
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",

          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/icons/Lock.svg',
              width: 6,
              height: 20,
              fit: BoxFit.contain,
            ),
          )
      ),
    );
  }


  TextFormField buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value!)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/icons/Mail.svg',
              width: 6,
              height: 20,
              fit: BoxFit.contain,
            ),
          )
      ),
    );
  }
}